defmodule PoolLadder do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(PoolLadder.Endpoint, []),
      worker(PoolLadder.Repo, []),
    ]

    opts = [strategy: :one_for_one, name: PoolLadder.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    PoolLadder.Endpoint.config_change(changed, removed)
    :ok
  end
end
