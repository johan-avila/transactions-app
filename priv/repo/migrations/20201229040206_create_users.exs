defmodule Transactions.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :amount, :float

      timestamps()
    end

  end
end
