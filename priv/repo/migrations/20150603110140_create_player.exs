defmodule PoolLadder.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :first_name, :string
      add :last_name, :string
      add :nickname, :string
      add :email, :string
      add :wins, :integer, default: 0
      add :losses, :integer, default: 0
      add :challenged, :integer, default: 0
      add :challenger, :integer, default: 0

      timestamps
    end

  end
end
