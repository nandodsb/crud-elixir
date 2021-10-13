# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :crud_elixir,
  ecto_repos: [CrudElixir.Repo]

# Configures the endpoint
config :crud_elixir, CrudElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "reFyMZmMNbgXTfgrAOpGLWc0XG2shHhy6IM6ca1Ac9/yye81B1mzq++bCYXL8J0R",
  render_errors: [view: CrudElixirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CrudElixir.PubSub,
  live_view: [signing_salt: "q8k7HG/Q"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
