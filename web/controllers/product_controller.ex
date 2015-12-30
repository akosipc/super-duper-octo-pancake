defmodule Bangis.ProductController do
  use Bangis.Web, :controller

  alias Bangis.Product
  alias Bangis.Category

  plug :scrub_params, "product" when action in [:create, :update]

  def index(conn, _params) do
    products = Repo.all from p in Product, preload: [:category]
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Product.changeset(%Product{})
    categories = Repo.all from(c in Category, select: {c.name, c.id})

    render(conn, "new.html", changeset: changeset, categories: categories)
  end

  def edit(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)
    changeset = Product.changeset(product)

    render(conn, "edit.html", changeset: changeset, product: product)
  end

  def show(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)
    render(conn, "show.html", product: product)
  end

  def create(conn, %{"product" => product_params}) do
    changeset = Product.changeset(%Product{}, product_params)

    case Repo.insert(changeset) do
      {:ok, _product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: product_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "There were some errors encountered.")
        |> render("new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Repo.get!(Product, id)
    changeset = Product.changeset(product, product_params)

    case Repo.update(changeset) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: product_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "There were some errors encountered.")
        |> render("edit.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)
    Repo.delete!(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: product_path(conn, :index))
  end
end
