defmodule Transactions.Repo.Migrations.CreateMovements do
  use Ecto.Migration

  def change do
    create table(:movements) do
      add :concept, :string
      add :amount, :float
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:movements, [:user_id])
  end
end
