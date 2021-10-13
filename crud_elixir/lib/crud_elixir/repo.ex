defmodule CrudElixir.Repo do
  use Ecto.Repo,
    otp_app: :crud_elixir,
    adapter: Ecto.Adapters.Postgres
end
