defmodule PoolLadder.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pool_ladder,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      preferred_cli_env: [espec: :test],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [mod: {PoolLadder, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :postgrex]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp deps do
    [
      {:phoenix, "~> 0.13.1"},
      {:phoenix_ecto, "~> 0.4"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 1.0"},
      {:phoenix_live_reload, "~> 0.4", only: :dev},
      {:cowboy, "~> 1.0"},
      {:espec_phoenix, github: "antonmi/espec_phoenix", only: :test, app: false},
      {:excoveralls, "~> 0.3.10", only: [:dev, :test]}
    ]
  end
end
