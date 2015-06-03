use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pool_ladder, PoolLadder.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pool_ladder, PoolLadder.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pool_ladder_test",
  size: 1 # Use a single connection for transactional tests
