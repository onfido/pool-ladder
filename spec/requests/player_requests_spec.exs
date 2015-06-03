defmodule PoolLadder.PostsRequestsSpec do

  use ESpec.Phoenix, request: PoolLadder.Endpoint

  before do
    player_one = %Player{first_name: "Player", last_name: "One", email: "one@demo.com"} |> PoolLadder.Repo.insert
    player_two = %Player{first_name: "Player", last_name: "Two", email: "two@demo.com"} |> PoolLadder.Repo.insert
    {:ok, player_one: player_one, player_two: player_two}
  end

  describe "index" do
    subject! do: get(conn(), player_path(conn(), :index))

    it do: should be_success
    it do: should use_view(PoolLadder.PlayerView)
    it do: should render_template("index.html")

    context "body" do
      let :html, do: subject.resp_body

      it do: html |> should have_content __.player_one.email
      it do: html |> should have_content __.player_two.last_name
    end
  end
end
