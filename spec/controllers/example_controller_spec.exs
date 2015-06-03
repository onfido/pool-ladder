defmodule PoolLadder.ExampleControllerSpec do

  use ESpec.Phoenix, controller: PoolLadder.PostsController

  describe "index" do
    let :examples do
      [
        %PoolLadder.Example{title: "Example 1"},
        %PoolLadder.Example{title: "Example 2"},
      ]
    end

    before do
      allow(PoolLadder.Repo).to accept(:all, fn -> examples end)
    end

    subject do: action :index

    it do: should be_successfull
    it do: should have_in_assigns(:examples, examples)
    
  end
end
