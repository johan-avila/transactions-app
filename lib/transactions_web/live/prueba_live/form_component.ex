defmodule TransactionsWeb.PruebaLive.FormComponent do
  use TransactionsWeb, :live_component

  alias Transactions.Pruebas

  @impl true
  def update(%{prueba: prueba} = assigns, socket) do
    changeset = Pruebas.change_prueba(prueba)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"prueba" => prueba_params}, socket) do
    changeset =
      socket.assigns.prueba
      |> Pruebas.change_prueba(prueba_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"prueba" => prueba_params}, socket) do
    save_prueba(socket, socket.assigns.action, prueba_params)
  end

  defp save_prueba(socket, :edit, prueba_params) do
    case Pruebas.update_prueba(socket.assigns.prueba, prueba_params) do
      {:ok, _prueba} ->
        {:noreply,
         socket
         |> put_flash(:info, "Prueba updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_prueba(socket, :new, prueba_params) do
    case Pruebas.create_prueba(prueba_params) do
      {:ok, _prueba} ->
        {:noreply,
         socket
         |> put_flash(:info, "Prueba created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
