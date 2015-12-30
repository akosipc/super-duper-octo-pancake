defmodule Bangis.OrderController do
  use Bangis.Web, :controller

  alias Bangis.Order
  alias Bangis.Customer

  plug :scrub_params, "order" when action in [:create, :update]

  def index(conn, %{"customer_id" => customer_id}) do
    customer = Repo.get!(Customer, customer_id)
  end
end
