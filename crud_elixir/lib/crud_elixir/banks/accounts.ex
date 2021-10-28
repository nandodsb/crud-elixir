defmodule CrudElixir.Banks.Accounts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :balance, :integer
    field :number, :string
    field :owner, :string

    timestamps()
  end

  @doc false
  def changeset(accounts, attrs) do
    accounts
    |> cast(attrs, [:number, :owner, :balance])
    |> validate_required([:number, :owner, :balance])
  end
end
