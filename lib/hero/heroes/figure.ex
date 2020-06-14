defmodule Hero.Heroes.Figure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tb_figure" do
    field :first_name, :string
    field :last_name, :string
    field :nickname, :string

    timestamps()
  end

  @doc false
  def changeset(figure, attrs) do
    figure
    |> cast(attrs, [:first_name, :last_name, :nickname])
    |> validate_required([:first_name, :last_name, :nickname])
  end
end
