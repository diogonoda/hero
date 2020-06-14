defmodule Hero.HeroesTest do
  use Hero.DataCase

  alias Hero.Heroes

  describe "tb_figure" do
    alias Hero.Heroes.Figure

    @valid_attrs %{first_name: "some first_name", last_name: "some last_name", nickname: "some nickname"}
    @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name", nickname: "some updated nickname"}
    @invalid_attrs %{first_name: nil, last_name: nil, nickname: nil}

    def figure_fixture(attrs \\ %{}) do
      {:ok, figure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Heroes.create_figure()

      figure
    end

    test "list_tb_figure/0 returns all tb_figure" do
      figure = figure_fixture()
      assert Heroes.list_tb_figure() == [figure]
    end

    test "get_figure!/1 returns the figure with given id" do
      figure = figure_fixture()
      assert Heroes.get_figure!(figure.id) == figure
    end

    test "create_figure/1 with valid data creates a figure" do
      assert {:ok, %Figure{} = figure} = Heroes.create_figure(@valid_attrs)
      assert figure.first_name == "some first_name"
      assert figure.last_name == "some last_name"
      assert figure.nickname == "some nickname"
    end

    test "create_figure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heroes.create_figure(@invalid_attrs)
    end

    test "update_figure/2 with valid data updates the figure" do
      figure = figure_fixture()
      assert {:ok, %Figure{} = figure} = Heroes.update_figure(figure, @update_attrs)
      assert figure.first_name == "some updated first_name"
      assert figure.last_name == "some updated last_name"
      assert figure.nickname == "some updated nickname"
    end

    test "update_figure/2 with invalid data returns error changeset" do
      figure = figure_fixture()
      assert {:error, %Ecto.Changeset{}} = Heroes.update_figure(figure, @invalid_attrs)
      assert figure == Heroes.get_figure!(figure.id)
    end

    test "delete_figure/1 deletes the figure" do
      figure = figure_fixture()
      assert {:ok, %Figure{}} = Heroes.delete_figure(figure)
      assert_raise Ecto.NoResultsError, fn -> Heroes.get_figure!(figure.id) end
    end

    test "change_figure/1 returns a figure changeset" do
      figure = figure_fixture()
      assert %Ecto.Changeset{} = Heroes.change_figure(figure)
    end
  end
end
