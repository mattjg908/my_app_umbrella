use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_app_web, MyAppWeb.Endpoint,
  # Should match docker-compose.yml
  http: [port: 4101],
  server: false

config :core, Core.Repo,
  database: "core_repo_test",
  username: "user",
  password: "pass",
  hostname: "localhost"

# Print only warnings and errors during test
config :logger, level: :warn
