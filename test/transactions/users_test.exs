defmodule Transactions.UsersTest do
  use Transactions.DataCase

  alias Transactions.Users

  describe "users" do
    alias Transactions.Users.User

    @valid_attrs %{amount: 120.5, email: "some email", username: "some username"}
    @update_attrs %{amount: 456.7, email: "some updated email", username: "some updated username"}
    # @invalid_attrs %{amount: nil, email: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.amount == 120.5
      assert user.email == "some email"
      assert user.username == "some username"
    end


    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.amount == 456.7
      assert user.email == "some updated email"
      assert user.username == "some updated username"
    end


    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
