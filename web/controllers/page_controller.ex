defmodule InvestmentMonitoring.PageController do
  use InvestmentMonitoring.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
