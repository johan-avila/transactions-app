defmodule TransactionsWeb.MovementLive do
  use TransactionsWeb, :live_view
  def mount(_params, _session,socket) do
    {:ok, socket}
  end
end
