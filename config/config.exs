# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

config :core, Core.Repo,
  database: "core_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"



config :my_app_web,
  generators: [context_app: :my_app]

# Configures the endpoint
config :my_app_web, MyAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9IyTmIzJ2rMuJsNu2OUFQ0ar+jmnw77vvs3rQut5WK3LHiiJErAoH3l6E4+Elxyj",
  render_errors: [view: MyAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MyApp.PubSub,
  live_view: [signing_salt: "O3qdrbMt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
