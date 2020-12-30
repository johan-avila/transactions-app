defmodule TransactionsWeb.PruebaLiveTest do
  use TransactionsWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Transactions.Pruebas

  @create_attrs %{email: "some email", name: "some name"}
  @update_attrs %{email: "some updated email", name: "some updated name"}
  @invalid_attrs %{email: nil, name: nil}

  defp fixture(:prueba) do
    {:ok, prueba} = Pruebas.create_prueba(@create_attrs)
    prueba
  end

  defp create_prueba(_) do
    prueba = fixture(:prueba)
    %{prueba: prueba}
  end

  describe "Index" do
    setup [:create_prueba]

    test "lists all pruebas", %{conn: conn, prueba: prueba} do
      {:ok, _index_live, html} = live(conn, Routes.prueba_index_path(conn, :index))

      assert html =~ "Listing Pruebas"
      assert html =~ prueba.email
    end

    test "saves new prueba", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.prueba_index_path(conn, :index))

      assert index_live |> element("a", "New Prueba") |> render_click() =~
               "New Prueba"

      assert_patch(index_live, Routes.prueba_index_path(conn, :new))

      assert index_live
             |> form("#prueba-form", prueba: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#prueba-form", prueba: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.prueba_index_path(conn, :index))

      assert html =~ "Prueba created successfully"
      assert html =~ "some email"
    end

    test "updates prueba in listing", %{conn: conn, prueba: prueba} do
      {:ok, index_live, _html} = live(conn, Routes.prueba_index_path(conn, :index))

      assert index_live |> element("#prueba-#{prueba.id} a", "Edit") |> render_click() =~
               "Edit Prueba"

      assert_patch(index_live, Routes.prueba_index_path(conn, :edit, prueba))

      assert index_live
             |> form("#prueba-form", prueba: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#prueba-form", prueba: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.prueba_index_path(conn, :index))

      assert html =~ "Prueba updated successfully"
      assert html =~ "some updated email"
    end

    test "deletes prueba in listing", %{conn: conn, prueba: prueba} do
      {:ok, index_live, _html} = live(conn, Routes.prueba_index_path(conn, :index))

      assert index_live |> element("#prueba-#{prueba.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#prueba-#{prueba.id}")
    end
  end

  describe "Show" do
    setup [:create_prueba]

    test "displays prueba", %{conn: conn, prueba: prueba} do
      {:ok, _show_live, html} = live(conn, Routes.prueba_show_path(conn, :show, prueba))

      assert html =~ "Show Prueba"
      assert html =~ prueba.email
    end

    test "updates prueba within modal", %{conn: conn, prueba: prueba} do
      {:ok, show_live, _html} = live(conn, Routes.prueba_show_path(conn, :show, prueba))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Prueba"

      assert_patch(show_live, Routes.prueba_show_path(conn, :edit, prueba))

      assert show_live
             |> form("#prueba-form", prueba: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#prueba-form", prueba: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.prueba_show_path(conn, :show, prueba))

      assert html =~ "Prueba updated successfully"
      assert html =~ "some updated email"
    end
  end
end
