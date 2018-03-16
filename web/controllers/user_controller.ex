defmodule UserController do
  use InvestmentMonitoring.Web, :controller

  def index(conn, _params) do
    users = Repo.all(User)
    render conn, "index.html", users: users
  end
end
