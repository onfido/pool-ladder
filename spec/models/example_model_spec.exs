defmodule PoolLadder.ExampleModelSpec do

  use ESpec.Phoenix, model: PoolLadder.Example

  let :example, do: %PoolLadder.Example{title: "Example 1"}
  it do: example.title |> should eq "Example 1"

end
