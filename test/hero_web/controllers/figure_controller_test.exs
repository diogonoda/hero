defmodule HeroWeb.FigureControllerTest do
  use HeroWeb.ConnCase

  alias Hero.Heroes
  alias Hero.Heroes.Figure

  @create_attrs %{
    first_name: "some first_name",
    last_name: "some last_name",
    nickname: "some nickname"
  }
  @update_attrs %{
    first_name: "some updated first_name",
    last_name: "some updated last_name",
    nickname: "some updated nickname"
  }
  @invalid_attrs %{first_name: nil, last_name: nil, nickname: nil}

  def fixture(:figure) do
    {:ok, figure} = Heroes.create_figure(@create_attrs)
    figure
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tb_figure", %{conn: conn} do
      conn = get(conn, Routes.figure_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create figure" do
    test "renders figure when data is valid", %{conn: conn} do
      conn = post(conn, Routes.figure_path(conn, :create), figure: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.figure_path(conn, :show, id))

      assert %{
               "id" => id,
               "first_name" => "some first_name",
               "last_name" => "some last_name",
               "nickname" => "some nickname"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.figure_path(conn, :create), figure: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update figure" do
    setup [:create_figure]

    test "renders figure when data is valid", %{conn: conn, figure: %Figure{id: id} = figure} do
      conn = put(conn, Routes.figure_path(conn, :update, figure), figure: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.figure_path(conn, :show, id))

      assert %{
               "id" => id,
               "first_name" => "some updated first_name",
               "last_name" => "some updated last_name",
               "nickname" => "some updated nickname"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, figure: figure} do
      conn = put(conn, Routes.figure_path(conn, :update, figure), figure: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete figure" do
    setup [:create_figure]

    test "deletes chosen figure", %{conn: conn, figure: figure} do
      conn = delete(conn, Routes.figure_path(conn, :delete, figure))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.figure_path(conn, :show, figure))
      end
    end
  end

  defp create_figure(_) do
    figure = fixture(:figure)
    %{figure: figure}
  end
end
