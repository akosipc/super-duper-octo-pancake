defmodule Bangis.CategoryController do
  use Bangis.Web, :controller

  alias Bangis.Category

  plug :scrub_params, "category" when action in [:create, :update]

  def index(conn, _params) do
    categories = Repo.all(Category)
    render(conn, "index.html", categories: categories)
  end

  def new(conn, _params) do
    changeset = Category.changeset(%Category{})
    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    changeset = Category.changeset(category)

    render(conn, "edit.html", changeset: changeset, category: category)
  end

  def create(conn, %{"category" => category_params}) do
    changeset = Category.changeset(%Category{}, category_params)

    case Repo.insert(changeset) do
      {:ok, _category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: category_path(conn, :index))
      {:error, changset} ->
        conn
        |> put_flash(:error, "There were some errors encountered.")
        |> render("new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Repo.get!(Category, id)
    changeset = Category.changeset(category, category_params)

    case Repo.update(changeset) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category successfully updated.")
        |> redirect(to: category_path(conn, :index))
      {:error = changeset} ->
        conn
        |> put_flash(:error, "There were some errors encountered")
        |> render("edit.html", changeset: changeset, category: category)
    end
  end

  def destroy(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    Repo.delete!(category)

    conn
    |> put_flash(:info, "Category successfully deleted.")
    |> redirect(to: category_path(conn, :index))
  end

end
