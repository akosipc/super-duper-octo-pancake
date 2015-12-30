defmodule Bangis.CustomerController do
  use Bangis.Web, :controller

  alias Bangis.Customer

  plug :scrub_params, "customer" when action in [:create, :update]

  def index(conn, _params) do
    customers = Repo.all(Customer)
    render(conn, "index.html", customers: customers)
  end

  def new(conn, _params) do
    changeset = Customer.changeset(%Customer{})
    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    customer = Repo.get!(Customer, id)
    changeset = Customer.changeset(customer)

    render(conn, "edit.html", changeset: changeset, customer: customer)
  end

  def show(conn, %{"id" => id}) do
    customer = Repo.get!(Customer, id)
    render(conn, "show.html", customer: customer)
  end

  def create(conn, %{"customer" => customer_params}) do
    changeset = Customer.changeset(%Customer{}, customer_params)

    case Repo.insert(changeset) do
      {:ok, _customer} ->
        conn
        |> put_flash(:info, "Customer created successfully.")
        |> redirect(to: customer_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "There were some errors encountered.")
        |> render("new.html", changeset: changeset)
    end

  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Repo.get!(Customer, id)
    changeset = Customer.changeset(customer, customer_params)

    case Repo.update(changeset) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Customer successfully updated.")
        |> redirect(to: customer_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "There were some errors encountered")
        |> render("edit.html", changeset: changeset, customer: customer)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Repo.get!(Customer, id)
    Repo.delete!(customer)

    conn
    |> put_flash(:info, "Customer successfully deleted.")
    |> redirect(to: customer_path(conn, :index))
  end
end
