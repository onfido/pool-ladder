defmodule PoolLadder.ExampleViewsSpec do

  use ESpec.Phoenix, view: PoolLadder.PlayerView

    let :players do
      [
        %Player{id: 1, first_name: "Player", last_name: "One", email: "one@demo.com"},
        %Player{id: 2, first_name: "Player", last_name: "Two", email: "two@demo.com"}
      ]
    end

    describe "index html" do
      subject do: render("index.html", players: players)

      it do: should have_content "One"
      it do: should have_text "Two"
    end
end
