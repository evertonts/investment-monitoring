defmodule InvestmentMonitoring.UserControllerTest do
  use InvestmentMonitoring.ConnCase

  test "#index renders all users" do
    conn = build_conn()
    conn = get conn, user_path(conn, :index)

    assert json_response(conn, 200) == %{
      "users" => []
    }
  end
end
