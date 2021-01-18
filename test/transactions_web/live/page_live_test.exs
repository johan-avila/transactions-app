defmodule TransactionsWeb.PageLiveTest do
  use TransactionsWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, _page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to Transactions-app!"
  end
end
