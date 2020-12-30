defmodule Transactions.PruebasTest do
  use Transactions.DataCase

  alias Transactions.Pruebas

  describe "pruebas" do
    alias Transactions.Pruebas.Prueba

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def prueba_fixture(attrs \\ %{}) do
      {:ok, prueba} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pruebas.create_prueba()

      prueba
    end

    test "list_pruebas/0 returns all pruebas" do
      prueba = prueba_fixture()
      assert Pruebas.list_pruebas() == [prueba]
    end

    test "get_prueba!/1 returns the prueba with given id" do
      prueba = prueba_fixture()
      assert Pruebas.get_prueba!(prueba.id) == prueba
    end

    test "create_prueba/1 with valid data creates a prueba" do
      assert {:ok, %Prueba{} = prueba} = Pruebas.create_prueba(@valid_attrs)
      assert prueba.email == "some email"
      assert prueba.name == "some name"
    end

    test "create_prueba/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pruebas.create_prueba(@invalid_attrs)
    end

    test "update_prueba/2 with valid data updates the prueba" do
      prueba = prueba_fixture()
      assert {:ok, %Prueba{} = prueba} = Pruebas.update_prueba(prueba, @update_attrs)
      assert prueba.email == "some updated email"
      assert prueba.name == "some updated name"
    end

    test "update_prueba/2 with invalid data returns error changeset" do
      prueba = prueba_fixture()
      assert {:error, %Ecto.Changeset{}} = Pruebas.update_prueba(prueba, @invalid_attrs)
      assert prueba == Pruebas.get_prueba!(prueba.id)
    end

    test "delete_prueba/1 deletes the prueba" do
      prueba = prueba_fixture()
      assert {:ok, %Prueba{}} = Pruebas.delete_prueba(prueba)
      assert_raise Ecto.NoResultsError, fn -> Pruebas.get_prueba!(prueba.id) end
    end

    test "change_prueba/1 returns a prueba changeset" do
      prueba = prueba_fixture()
      assert %Ecto.Changeset{} = Pruebas.change_prueba(prueba)
    end
  end
end
