defmodule Transactions.MovementsTest do
  use Transactions.DataCase

  alias Transactions.Movements

  describe "movements" do
    alias Transactions.Movements.Movement

    @valid_attrs %{amount: 120.5, concept: "some concept"}
    @update_attrs %{amount: 456.7, concept: "some updated concept"}
    @invalid_attrs %{amount: nil, concept: nil}

    def movement_fixture(attrs \\ %{}) do
      {:ok, movement} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Movements.create_movement()

      movement
    end

    test "list_movements/0 returns all movements" do
      movement = movement_fixture()
      assert Movements.list_movements() == [movement]
    end

    test "get_movement!/1 returns the movement with given id" do
      movement = movement_fixture()
      assert Movements.get_movement!(movement.id) == movement
    end

    test "create_movement/1 with valid data creates a movement" do
      assert {:ok, %Movement{} = movement} = Movements.create_movement(@valid_attrs)
      assert movement.amount == 120.5
      assert movement.concept == "some concept"
    end

    test "create_movement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movements.create_movement(@invalid_attrs)
    end

    test "update_movement/2 with valid data updates the movement" do
      movement = movement_fixture()
      assert {:ok, %Movement{} = movement} = Movements.update_movement(movement, @update_attrs)
      assert movement.amount == 456.7
      assert movement.concept == "some updated concept"
    end

    test "update_movement/2 with invalid data returns error changeset" do
      movement = movement_fixture()
      assert {:error, %Ecto.Changeset{}} = Movements.update_movement(movement, @invalid_attrs)
      assert movement == Movements.get_movement!(movement.id)
    end

    test "delete_movement/1 deletes the movement" do
      movement = movement_fixture()
      assert {:ok, %Movement{}} = Movements.delete_movement(movement)
      assert_raise Ecto.NoResultsError, fn -> Movements.get_movement!(movement.id) end
    end

    test "change_movement/1 returns a movement changeset" do
      movement = movement_fixture()
      assert %Ecto.Changeset{} = Movements.change_movement(movement)
    end
  end
end
