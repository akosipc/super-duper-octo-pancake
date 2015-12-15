defmodule Bangis.UserController do
  use Bangis.Web, :controller

  alias Bangis.User

  plug :scrub_params, "user" when action in [:create, :update]

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

end
