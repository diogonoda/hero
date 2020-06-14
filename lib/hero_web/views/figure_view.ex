defmodule HeroWeb.FigureView do
  use HeroWeb, :view
  alias HeroWeb.FigureView

  def render("index.json", %{tb_figure: tb_figure}) do
    %{data: render_many(tb_figure, FigureView, "figure.json")}
  end

  def render("show.json", %{figure: figure}) do
    %{data: render_one(figure, FigureView, "figure.json")}
  end

  def render("figure.json", %{figure: figure}) do
    %{id: figure.id,
      first_name: figure.first_name,
      last_name: figure.last_name,
      nickname: figure.nickname}
  end
end
