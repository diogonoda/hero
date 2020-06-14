defmodule Hero.Repo.Migrations.CreateTbFigure do
  use Ecto.Migration

  def change do
    create table(:tb_figure) do
      add :first_name, :string
      add :last_name, :string
      add :nickname, :string

      timestamps()
    end

  end
end
