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
    plug :accepts, ["json", "graphql"]
  end

  scope "/", InvestmentMonitoring do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: InvestmentMonitoring.Schema,
    interface: :advanced

  forward "/graphql",
    Absinthe.Plug,
    schema: InvestmentMonitoring.Schema
end
