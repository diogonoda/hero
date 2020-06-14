defmodule HeroWeb.FigureController do
  use HeroWeb, :controller

  alias Hero.Heroes
  alias Hero.Heroes.Figure

  action_fallback HeroWeb.FallbackController

  def index(conn, _params) do
    tb_figure = Heroes.list_tb_figure()
    render(conn, "index.json", tb_figure: tb_figure)
  end

  def create(conn, %{"figure" => figure_params}) do
    with {:ok, %Figure{} = figure} <- Heroes.create_figure(figure_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.figure_path(conn, :show, figure))
      |> render("show.json", figure: figure)
    end
  end

  def show(conn, %{"id" => id}) do
    figure = Heroes.get_figure!(id)
    render(conn, "show.json", figure: figure)
  end

  def update(conn, %{"id" => id, "figure" => figure_params}) do
    figure = Heroes.get_figure!(id)

    with {:ok, %Figure{} = figure} <- Heroes.update_figure(figure, figure_params) do
      render(conn, "show.json", figure: figure)
    end
  end

  def delete(conn, %{"id" => id}) do
    figure = Heroes.get_figure!(id)

    with {:ok, %Figure{}} <- Heroes.delete_figure(figure) do
      send_resp(conn, :no_content, "")
    end
  end
end
