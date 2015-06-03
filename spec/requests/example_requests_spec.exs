defmodule PoolLadder.PostsRequestsSpec do

  use ESpec.Phoenix, request: PoolLadder.Endpoint

  describe "index" do
    
    before do
      ex1 = %PoolLadder.Example{title: "Example 1"} |> PoolLadder.Repo.insert
      ex2 = %PoolLadder.Example{title: "Example 2"} |> PoolLadder.Repo.insert
      {:ok, ex1: ex1, ex2: ex2}
    end

    subject! do: get(conn(), examples_path(conn(), :index))

    it do: should be_successfull
    it do: should be_success

    context "check body" do
      let :html, do: subject.resp_body

      it do: html |> should have_content __.ex1.title
      it do: html |> should have_text __.ex2.title
    end
  end
end
