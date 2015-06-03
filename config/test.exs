use Mix.Config

config :pool_ladder, PoolLadder.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :pool_ladder, PoolLadder.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pool_ladder_test",
  size: 1 # Use a single connection for transactional tests
