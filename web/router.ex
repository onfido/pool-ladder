defmodule PoolLadder.Router do
  use PoolLadder.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PoolLadder do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/players", PlayerController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PoolLadder do
  #   pipe_through :api
  # end
end
