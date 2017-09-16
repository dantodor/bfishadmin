use Mix.Config

# General application configuration

config :comeonin, Ecto.Password, Comeonin.Pbkdf2


config :bfish,
  ecto_repos: [Bfish.Repo]

# Configures the endpoint
config :bfish, BfishWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0Di4JPaYjR/6jXsOu0fDGjRCL9UIpysFTaU5DDjrGRQU2K7zeceWWozNxk06x6Ax",
  render_errors: [view: BfishWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Bfish.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
