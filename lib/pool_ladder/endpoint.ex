defmodule PoolLadder.Endpoint do
  use Phoenix.Endpoint, otp_app: :pool_ladder

  plug Plug.Static,
    at: "/", from: :pool_ladder, gzip: false,
    only: ~w(css images js favicon.ico robots.txt)

  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_pool_ladder_key",
    signing_salt: "mHUXV+nn"

  plug :router, PoolLadder.Router
end
