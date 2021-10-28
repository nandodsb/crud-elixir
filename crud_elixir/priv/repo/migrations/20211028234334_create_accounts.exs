defmodule CrudElixir.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :number, :string
      add :owner, :string
      add :balance, :integer

      timestamps()
    end

  end
end
