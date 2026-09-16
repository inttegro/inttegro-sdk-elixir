#!/usr/bin/env ruby
# frozen_string_literal: true

require "fileutils"
require_relative "semantic_custom_data"

# Splits generated monoliths after namespace and documentation enrichment. The
# generator can continue to emit deterministic aggregate files; public source
# links and maintainers get one focused file per Elixir domain.

ROOT = File.expand_path("..", __dir__)
LIB = File.join(ROOT, "lib/inttegro")
GENERATED_PATH = File.join(LIB, "generated.ex")
RESOURCES_PATH = File.join(LIB, "resources.ex")

def module_blocks(source, pattern)
  starts = source.enum_for(:scan, pattern).map do
    [Regexp.last_match.begin(0), Regexp.last_match(1)]
  end

  starts.each_with_index.map do |(offset, name), index|
    finish = index + 1 < starts.length ? starts[index + 1][0] : source.length
    [name, source[offset...finish].rstrip + "\n"]
  end
end

def snake_case(name)
  name
    .gsub(/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
    .gsub(/([a-z0-9])([A-Z])/, "\\1_\\2")
    .downcase
end

abort("Expected #{GENERATED_PATH}") unless File.file?(GENERATED_PATH)
abort("Expected #{RESOURCES_PATH}") unless File.file?(RESOURCES_PATH)

generated = File.read(GENERATED_PATH)
generated_blocks = module_blocks(generated, /^defmodule (Inttegro\.[A-Za-z0-9_.]+) do$/)
abort("Generated module count changed: #{generated_blocks.length}") unless generated_blocks.length == 472

generated_groups = generated_blocks.group_by do |module_name, _block|
  parts = module_name.split(".")
  parts.length == 2 ? "internal" : snake_case(parts.fetch(1))
end

generated_groups.each do |group, blocks|
  path = if group == "internal"
           File.join(LIB, "codec.ex")
         else
           File.join(LIB, group, "types.ex")
         end
  FileUtils.mkdir_p(File.dirname(path))
  source = blocks.map { |_name, block| SemanticCustomData.transform_block(block) }.join("\n")
  File.write(path, "# Generated Inttegro types for this domain. Do not edit manually.\n\n" + source)
end

resources = File.read(RESOURCES_PATH)
resource_blocks = module_blocks(resources, /^defmodule (Inttegro\.[A-Za-z0-9_]+) do$/)
abort("Resource module count changed: #{resource_blocks.length}") unless resource_blocks.length == 23

resource_blocks.each do |module_name, block|
  resource = module_name.split(".").last
  path = File.join(LIB, "#{snake_case(resource)}.ex")
  File.write(path, "# Typed Inttegro API resource.\n\n#{block}")
end

FileUtils.rm_f(GENERATED_PATH)
FileUtils.rm_f(RESOURCES_PATH)

puts "Split 472 generated modules and 23 resource APIs into domain source files."
