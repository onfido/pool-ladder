defmodule PoolLadder.Player do
  use PoolLadder.Web, :model

  schema "players" do
    field :first_name, :string
    field :last_name, :string
    field :nickname, :string
    field :email, :string
    field :wins, :integer
    field :losses, :integer
    field :challenged, :integer
    field :challenger, :integer

    timestamps
  end

  @required_fields ~w(first_name last_name nickname email wins losses challenged challenger)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
