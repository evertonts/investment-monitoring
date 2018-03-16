defmodule InvestmentMonitoring.Router do
  use InvestmentMonitoring.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

    get "/users", UserController, :index
    get "/users/:id", UserController, :show
  end

  scope "/", InvestmentMonitoring do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: InvestmentMonitoring.Schema,
      interface: :simple,
      context: %{pubsub: InvestmentMonitoring.Endpoint}
  end
end
