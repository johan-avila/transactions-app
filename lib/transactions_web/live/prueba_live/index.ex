defmodule TransactionsWeb.PruebaLive.Index do
  use TransactionsWeb, :live_view

  alias Transactions.Pruebas
  alias Transactions.Pruebas.Prueba

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pruebas, list_pruebas())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Prueba")
    |> assign(:prueba, Pruebas.get_prueba!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Prueba")
    |> assign(:prueba, %Prueba{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pruebas")
    |> assign(:prueba, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    prueba = Pruebas.get_prueba!(id)
    {:ok, _} = Pruebas.delete_prueba(prueba)

    {:noreply, assign(socket, :pruebas, list_pruebas())}
  end

  defp list_pruebas do
    Pruebas.list_pruebas()
  end
end
