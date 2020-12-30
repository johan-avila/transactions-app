defmodule Transactions.Pruebas.Prueba do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pruebas" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(prueba, attrs) do
    prueba
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
