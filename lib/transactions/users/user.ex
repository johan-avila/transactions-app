defmodule Transactions.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :amount, :float
    field :email, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :amount])
    |> validate_required([:username, :email, :amount])
  end
end
