#!/usr/bin/env ruby
# frozen_string_literal: true

# Restores the semantic custom-data wrappers after OpenAPI generation. The
# generator preserves the open-ended JSON shape, but it cannot infer whether
# that shape represents a decoded value, request input, or merge patch.
module SemanticCustomData
  module_function

  RAW_TYPES = [
    "%{optional(String.t()) => String.t() | nil} | nil",
    "%{optional(String.t()) => term()} | nil",
    "%{optional(String.t()) => String.t()} | nil"
  ].freeze
  WRAPPERS = %w[Inttegro.CustomDataPatch Inttegro.CustomDataInput Inttegro.CustomData].freeze

  FROM_MAP = /      custom_data:\n.*?^        \)(?<comma>,?)/m
  TO_MAP = /      "custom_data" =>\n.*?^        \)(?<comma>,?)/m

  def transform_block(block)
    type = (RAW_TYPES + WRAPPERS.map { |name| "#{name}.t() | nil" }).find do |candidate|
      block.include?("custom_data: #{candidate}")
    end
    return block unless type

    wrapper = if block.include?("%{optional(String.t()) => String.t() | nil}") ||
                 block.include?("custom_data: Inttegro.CustomDataPatch.t() | nil")
                "Inttegro.CustomDataPatch"
              elsif block.include?("@moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)")
                "Inttegro.CustomDataInput"
              else
                "Inttegro.CustomData"
              end

    transformed = block.sub("custom_data: #{type}", "custom_data: #{wrapper}.t() | nil")
    unless transformed.include?("else: #{wrapper}.from_map(Map.get(map, \"custom_data\"))")
      transformed = transformed.sub(FROM_MAP) do
        [
          "      custom_data:",
          "        if(is_nil(Map.get(map, \"custom_data\")),",
          "          do: nil,",
          "          else: #{wrapper}.from_map(Map.get(map, \"custom_data\"))",
          "        )#{Regexp.last_match[:comma]}"
        ].join("\n")
      end
    end

    unless transformed.include?("Inttegro.Codec.encode(value.custom_data))")
      transformed = transformed.sub(TO_MAP) do
        [
          "      \"custom_data\" =>",
          "        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data))#{Regexp.last_match[:comma]}"
        ].join("\n")
      end
    end

    transformed
  end

  def transform_source(source)
    source.split(/(?=^defmodule )/).map { |block| transform_block(block) }.join
  end
end

if $PROGRAM_NAME == __FILE__
  abort("Usage: ruby tools/semantic_custom_data.rb FILE...") if ARGV.empty?

  ARGV.each do |path|
    source = File.read(path)
    transformed = SemanticCustomData.transform_source(source)
    File.write(path, transformed) unless transformed == source
  end
end
