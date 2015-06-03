defmodule PoolLadder.PlayerControllerTest do
  use PoolLadder.ConnCase

  alias PoolLadder.Player
  @valid_attrs %{challenged: 42, challenger: 42, email: "some content", first_name: "some content", last_name: "some content", losses: 42, nickname: "some content", wins: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, player_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing players"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, player_path(conn, :new)
    assert html_response(conn, 200) =~ "New player"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, player_path(conn, :create), player: @valid_attrs
    assert redirected_to(conn) == player_path(conn, :index)
    assert Repo.get_by(Player, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, player_path(conn, :create), player: @invalid_attrs
    assert html_response(conn, 200) =~ "New player"
  end

  test "shows chosen resource", %{conn: conn} do
    player = Repo.insert %Player{}
    conn = get conn, player_path(conn, :show, player)
    assert html_response(conn, 200) =~ "Show player"
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    player = Repo.insert %Player{}
    conn = get conn, player_path(conn, :edit, player)
    assert html_response(conn, 200) =~ "Edit player"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    player = Repo.insert %Player{}
    conn = put conn, player_path(conn, :update, player), player: @valid_attrs
    assert redirected_to(conn) == player_path(conn, :index)
    assert Repo.get_by(Player, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    player = Repo.insert %Player{}
    conn = put conn, player_path(conn, :update, player), player: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit player"
  end

  test "deletes chosen resource", %{conn: conn} do
    player = Repo.insert %Player{}
    conn = delete conn, player_path(conn, :delete, player)
    assert redirected_to(conn) == player_path(conn, :index)
    refute Repo.get(Player, player.id)
  end
end
