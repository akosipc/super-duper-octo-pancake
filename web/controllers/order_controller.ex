defmodule Bangis.OrderController do
  use Bangis.Web, :controller

  alias Bangis.Order
  alias Bangis.OrderItem
  alias Bangis.Customer
  alias Bangis.Product

  plug :scrub_params, "order" when action in [:create, :update]
  
  def index(conn, _params) do
    orders = Repo.all(Order)
    render(conn ,"index.html", orders: orders)
  end

  def new(conn, %{"customer_id" => customer_id}) do
    customer = Repo.get!(Customer, customer_id)
    changeset = Order.changeset(%Order{})
    products = Repo.all from(p in Product, select: {p.sku, p.id})

    render(conn, "new.html", changeset: changeset, customer: customer, products: products)
  end

  def create(conn, %{"order" => order_params, "customer_id" => customer_id}) do
    
  end

  def edit(conn, %{"customer_id" => customer_id, "order_id" => id}) do

  end

  def update(conn, %{"customer_id" => customer_id, "order_id" => id, "order" => order_params}) do

  end

  def delete(conn, %{"customer_id" => customer_id, "id" => id}) do

  end
end
