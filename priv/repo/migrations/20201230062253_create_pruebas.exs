defmodule Transactions.Repo.Migrations.CreatePruebas do
  use Ecto.Migration

  def change do
    create table(:pruebas) do
      add :name, :string
      add :email, :string

      timestamps()
    end

  end
end
