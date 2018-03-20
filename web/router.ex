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
  end

  pipeline :graphql do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json],
      pass: ["*/*"],
      json_decoder: Poison
    plug InvestmentMonitoring.Context
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug,
      schema: InvestmentMonitoring.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: InvestmentMonitoring.Schema,
      interface: :advanced,
      context: %{pubsub: InvestmentMonitoring.Endpoint}
  end
end
