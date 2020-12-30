defmodule TransactionsWeb.UserLive do
  use TransactionsWeb, :live_view
  alias Transactions.Users

  def mount(_params, _session, socket) do
    Users.subscribe()
    {:ok, fetch(socket)}
  end

  def handle_event("add", %{"user" => user}, socket) do
    Users.create_user(user)
    {:noreply, fetch(socket)}
  end

  def handle_info({Users, [:user | _], _}, socket) do
    {:noreply, fetch(socket)}
  end
  # handle_event
  defp fetch(socket) do
    assign(socket, users: Users.list_users())
  end
end
