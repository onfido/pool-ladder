defmodule PoolLadder.PlayerTest do
  use PoolLadder.ModelCase

  alias PoolLadder.Player

  @valid_attrs %{challenged: 42, challenger: 42, email: "some content", first_name: "some content", last_name: "some content", losses: 42, nickname: "some content", wins: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Player.changeset(%Player{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Player.changeset(%Player{}, @invalid_attrs)
    refute changeset.valid?
  end
end
