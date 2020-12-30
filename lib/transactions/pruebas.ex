defmodule Transactions.Pruebas do
  @moduledoc """
  The Pruebas context.
  """

  import Ecto.Query, warn: false
  alias Transactions.Repo

  alias Transactions.Pruebas.Prueba

  @doc """
  Returns the list of pruebas.

  ## Examples

      iex> list_pruebas()
      [%Prueba{}, ...]

  """
  def list_pruebas do
    Repo.all(Prueba)
  end

  @doc """
  Gets a single prueba.

  Raises `Ecto.NoResultsError` if the Prueba does not exist.

  ## Examples

      iex> get_prueba!(123)
      %Prueba{}

      iex> get_prueba!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prueba!(id), do: Repo.get!(Prueba, id)

  @doc """
  Creates a prueba.

  ## Examples

      iex> create_prueba(%{field: value})
      {:ok, %Prueba{}}

      iex> create_prueba(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prueba(attrs \\ %{}) do
    %Prueba{}
    |> Prueba.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prueba.

  ## Examples

      iex> update_prueba(prueba, %{field: new_value})
      {:ok, %Prueba{}}

      iex> update_prueba(prueba, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prueba(%Prueba{} = prueba, attrs) do
    prueba
    |> Prueba.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a prueba.

  ## Examples

      iex> delete_prueba(prueba)
      {:ok, %Prueba{}}

      iex> delete_prueba(prueba)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prueba(%Prueba{} = prueba) do
    Repo.delete(prueba)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prueba changes.

  ## Examples

      iex> change_prueba(prueba)
      %Ecto.Changeset{data: %Prueba{}}

  """
  def change_prueba(%Prueba{} = prueba, attrs \\ %{}) do
    Prueba.changeset(prueba, attrs)
  end
end
