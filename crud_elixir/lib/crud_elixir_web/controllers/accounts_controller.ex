defmodule CrudElixirWeb.AccountsController do
  use CrudElixirWeb, :controller

  alias CrudElixir.Banks
  alias CrudElixir.Banks.Accounts

  def index(conn, _params) do
    accounts = Banks.list_accounts()
    render(conn, "index.html", accounts: accounts)
  end

  def new(conn, _params) do
    changeset = Banks.change_accounts(%Accounts{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"accounts" => accounts_params}) do
    case Banks.create_accounts(accounts_params) do
      {:ok, accounts} ->
        conn
        |> put_flash(:info, "Accounts created successfully.")
        |> redirect(to: Routes.accounts_path(conn, :show, accounts))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    accounts = Banks.get_accounts!(id)
    render(conn, "show.html", accounts: accounts)
  end

  def edit(conn, %{"id" => id}) do
    accounts = Banks.get_accounts!(id)
    changeset = Banks.change_accounts(accounts)
    render(conn, "edit.html", accounts: accounts, changeset: changeset)
  end

  def update(conn, %{"id" => id, "accounts" => accounts_params}) do
    accounts = Banks.get_accounts!(id)

    case Banks.update_accounts(accounts, accounts_params) do
      {:ok, accounts} ->
        conn
        |> put_flash(:info, "Accounts updated successfully.")
        |> redirect(to: Routes.accounts_path(conn, :show, accounts))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", accounts: accounts, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    accounts = Banks.get_accounts!(id)
    {:ok, _accounts} = Banks.delete_accounts(accounts)

    conn
    |> put_flash(:info, "Accounts deleted successfully.")
    |> redirect(to: Routes.accounts_path(conn, :index))
  end
end
