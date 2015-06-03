defmodule PoolLadder.PageController do
  use PoolLadder.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
