defmodule Transactions.Movements.Movement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movements" do
    field :amount, :float
    field :concept, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(movement, attrs) do
    movement
    |> cast(attrs, [:concept, :amount])
    |> validate_required([:concept, :amount])
  end
end
