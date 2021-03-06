defmodule Bangis.Router do
  use Bangis.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Bangis do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/categories", CategoryController
    resources "/products", ProductController
    resources "/customers", CustomerController do
      resources "/orders", OrderController
    end
    resources "/orders", OrderController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Bangis do
  #   pipe_through :api
  # end
end
