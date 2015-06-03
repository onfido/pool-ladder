defmodule ESpec.Phoenix.Extend do

  def model do
    quote do
      alias PoolLadder.Repo
      alias PoolLadder.Player
    end
  end

  def controller do
    quote do
      alias PoolLadder.Repo
      import PoolLadder.Router.Helpers
      alias PoolLadder.Player
    end
  end

  def request do
    quote do
      alias PoolLadder.Repo
      import PoolLadder.Router.Helpers
      alias PoolLadder.Player
    end
  end

  def router do
    quote do

    end
  end

  def view do
    quote do
      import PoolLadder.Router.Helpers
      alias PoolLadder.Player
    end
  end


  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
