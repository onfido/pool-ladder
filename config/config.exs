use Mix.Config

config :pool_ladder, PoolLadder.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "U8s5oh48WTktZGEcHysjCsGacc1MMjR2XJZbt+F8bI7AyWwdqyxVsQmuv9kBrgOC",
  debug_errors: false,
  pubsub: [name: PoolLadder.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
