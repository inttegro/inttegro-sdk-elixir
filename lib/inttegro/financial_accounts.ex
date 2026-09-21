# Typed Inttegro API resource.

defmodule Inttegro.FinancialAccounts do
  @moduledoc Inttegro.Docs.resource_doc(__MODULE__)
  alias Inttegro.Client

  @doc Inttegro.Docs.operation_doc(__MODULE__, :create)
  @spec create(
          Client.t(),
          Inttegro.FinancialAccounts.CreateRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def create(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/create",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.create",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :lookup)
  @spec lookup(Client.t(), Inttegro.FinancialAccounts.IDRequest.t(), keyword()) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def lookup(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/lookup",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.lookup",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :page)
  @spec page(Client.t(), Inttegro.FinancialAccounts.PageRequest.t(), keyword()) ::
          {:ok, Inttegro.FinancialAccounts.Page.t()} | {:error, Exception.t()}
  def page(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/page",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.page",
             "page",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.Page.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :connect)
  @spec connect(
          Client.t(),
          Inttegro.FinancialAccounts.CreateRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def connect(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/connect",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.connect",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :update)
  @spec update(
          Client.t(),
          Inttegro.FinancialAccounts.UpdateRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def update(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/update",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.update",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :enable_push)
  @spec enable_push(
          Client.t(),
          Inttegro.FinancialAccounts.IDRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def enable_push(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/enable_push",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.enable_push",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :disable_push)
  @spec disable_push(
          Client.t(),
          Inttegro.FinancialAccounts.DisableRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def disable_push(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/disable_push",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.disable_push",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :disconnect)
  @spec disconnect(
          Client.t(),
          Inttegro.FinancialAccounts.DisableRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def disconnect(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/disconnect",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.disconnect",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :reconnect)
  @spec reconnect(Client.t(), Inttegro.FinancialAccounts.IDRequest.t(), keyword()) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def reconnect(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/reconnect",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.reconnect",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :enable_pull)
  @spec enable_pull(
          Client.t(),
          Inttegro.FinancialAccounts.EnablePullRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def enable_pull(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/enable_pull",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.enable_pull",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc Inttegro.Docs.operation_doc(__MODULE__, :disable_pull)
  @spec disable_pull(
          Client.t(),
          Inttegro.FinancialAccounts.IDRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.FinancialAccounts.FinancialAccount.t()} | {:error, Exception.t()}
  def disable_pull(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/disable_pull",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.disable_pull",
             "account",
             true
           ) do
      {:ok, Inttegro.FinancialAccounts.FinancialAccount.from_map(value)}
    end
  end

  @doc "Search financial accounts with a typed resource-local query."
  @spec search(Client.t(), Inttegro.Search.Request.t(), keyword()) ::
          {:ok, Inttegro.Search.Page.t()} | {:error, Exception.t()}
  def search(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/financial_accounts/search",
             Inttegro.Codec.encode(request),
             options,
             "financial_accounts.search",
             "search",
             true
           ) do
      {:ok, Inttegro.Search.Page.from_map(value)}
    end
  end
end
