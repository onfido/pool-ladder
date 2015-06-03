defmodule PoolLadder.PlayerControllerSpec do

  use ESpec.Phoenix, controller: PoolLadder.PlayerController

  let :players do
    [
      %Player{first_name: "Player", last_name: "One", email: "one@demo.com"},
      %Player{first_name: "Player", last_name: "Two", email: "two@demo.com"}
    ]
  end

  before do
    allow(PoolLadder.Repo).to accept(:all, fn -> players end)
  end

  describe "index" do
    subject do: action :index

    it do: should be_successfull
    it do: should have_http_status 200
  end
end
