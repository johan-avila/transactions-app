defmodule TransactionsWeb.MovementLive do
  use TransactionsWeb, :live_view
  alias Transactions.Movements

  def mount(_params, _session, socket) do
    Movements.subscribe()
    {:ok, fetch(socket)}
  end
  #Hndle events of HTML
  def handle_event("add", %{"movement" => movement}, socket) do
    Movements.create_movement(movement)
    {:noreply, fetch(socket)}
  end
  #Watcher (Phoenix live)
  def handle_info({Movements,  [ :movement | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, movements: Movements.list_movements())
  end
end
