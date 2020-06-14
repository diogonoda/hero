defmodule Hero.Heroes do
  @moduledoc """
  The Heroes context.
  """

  import Ecto.Query, warn: false
  alias Hero.Repo

  alias Hero.Heroes.Figure

  @doc """
  Returns the list of tb_figure.

  ## Examples

      iex> list_tb_figure()
      [%Figure{}, ...]

  """
  def list_tb_figure do
    Repo.all(Figure)
  end

  @doc """
  Gets a single figure.

  Raises `Ecto.NoResultsError` if the Figure does not exist.

  ## Examples

      iex> get_figure!(123)
      %Figure{}

      iex> get_figure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_figure!(id), do: Repo.get!(Figure, id)

  @doc """
  Creates a figure.

  ## Examples

      iex> create_figure(%{field: value})
      {:ok, %Figure{}}

      iex> create_figure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_figure(attrs \\ %{}) do
    %Figure{}
    |> Figure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a figure.

  ## Examples

      iex> update_figure(figure, %{field: new_value})
      {:ok, %Figure{}}

      iex> update_figure(figure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_figure(%Figure{} = figure, attrs) do
    figure
    |> Figure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a figure.

  ## Examples

      iex> delete_figure(figure)
      {:ok, %Figure{}}

      iex> delete_figure(figure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_figure(%Figure{} = figure) do
    Repo.delete(figure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking figure changes.

  ## Examples

      iex> change_figure(figure)
      %Ecto.Changeset{data: %Figure{}}

  """
  def change_figure(%Figure{} = figure, attrs \\ %{}) do
    Figure.changeset(figure, attrs)
  end
end
