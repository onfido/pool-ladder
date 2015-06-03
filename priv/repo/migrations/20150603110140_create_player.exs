defmodule PoolLadder.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :first_name, :string
      add :last_name, :string
      add :nickname, :string
      add :email, :string
      add :wins, :integer
      add :losses, :integer
      add :challenged, :integer
      add :challenger, :integer

      timestamps
    end

  end
end
