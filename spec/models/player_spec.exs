defmodule PoolLadder.PlayerSpec do

  use ESpec.Phoenix, model: PoolLadder.Player
  alias PoolLadder.Player

  let :valid_attributes do
    %{
      email: "demo@demo.com",
      first_name: "first name",
      last_name: "last name"
    }
  end

  let :invalid_attributes, do: %{}
  let :valid_changeset, do: Player.changeset(%Player{}, valid_attributes)
  let :invalid_changeset, do: Player.changeset(%Player{}, invalid_attributes)

  describe "Models#Player" do
    context "create" do
      it "should create a model when passing valid attributes" do
        expect(valid_changeset).to be_valid
      end

      it "should not create a model when passing invalid attributes" do
        expect(invalid_changeset).not_to be_valid
      end
    end

    context "default attributes" do
      let :player, do: Repo.insert(valid_changeset)

      it "should set default value for wins" do
        expect(player.wins).to eq(0)
      end

      it "should set default value for losses"  do
        expect(player.losses).to eq(0)
      end

      it "should set default value for challenged" do
        expect(player.challenged).to eq(0)
      end

      it "should set default value for challenger" do
        expect(player.challenger).to eq(0)
      end
    end
  end
end
