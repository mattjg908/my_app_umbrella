use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_app_web, MyAppWeb.Endpoint,
  # Should match docker-compose.yml
  http: [port: 4101],
  server: false

# Obviously in a real app dev, test and prod wouldn't have the same username,
# password, etc.
#
# Check my_app_umbrella/.env and my_app_umbrella/docker-compose.yml for values
config :core, Core.Repo, database: System.get_env("POSTGRES_DB_TEST")

# Print only warnings and errors during test
config :logger, level: :warn
