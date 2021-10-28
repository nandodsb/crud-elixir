defmodule CrudElixir.BanksTest do
  use CrudElixir.DataCase

  alias CrudElixir.Banks

  describe "accounts" do
    alias CrudElixir.Banks.Accounts

    @valid_attrs %{balance: 42, number: "some number", owner: "some owner"}
    @update_attrs %{balance: 43, number: "some updated number", owner: "some updated owner"}
    @invalid_attrs %{balance: nil, number: nil, owner: nil}

    def accounts_fixture(attrs \\ %{}) do
      {:ok, accounts} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Banks.create_accounts()

      accounts
    end

    test "list_accounts/0 returns all accounts" do
      accounts = accounts_fixture()
      assert Banks.list_accounts() == [accounts]
    end

    test "get_accounts!/1 returns the accounts with given id" do
      accounts = accounts_fixture()
      assert Banks.get_accounts!(accounts.id) == accounts
    end

    test "create_accounts/1 with valid data creates a accounts" do
      assert {:ok, %Accounts{} = accounts} = Banks.create_accounts(@valid_attrs)
      assert accounts.balance == 42
      assert accounts.number == "some number"
      assert accounts.owner == "some owner"
    end

    test "create_accounts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banks.create_accounts(@invalid_attrs)
    end

    test "update_accounts/2 with valid data updates the accounts" do
      accounts = accounts_fixture()
      assert {:ok, %Accounts{} = accounts} = Banks.update_accounts(accounts, @update_attrs)
      assert accounts.balance == 43
      assert accounts.number == "some updated number"
      assert accounts.owner == "some updated owner"
    end

    test "update_accounts/2 with invalid data returns error changeset" do
      accounts = accounts_fixture()
      assert {:error, %Ecto.Changeset{}} = Banks.update_accounts(accounts, @invalid_attrs)
      assert accounts == Banks.get_accounts!(accounts.id)
    end

    test "delete_accounts/1 deletes the accounts" do
      accounts = accounts_fixture()
      assert {:ok, %Accounts{}} = Banks.delete_accounts(accounts)
      assert_raise Ecto.NoResultsError, fn -> Banks.get_accounts!(accounts.id) end
    end

    test "change_accounts/1 returns a accounts changeset" do
      accounts = accounts_fixture()
      assert %Ecto.Changeset{} = Banks.change_accounts(accounts)
    end
  end
end
