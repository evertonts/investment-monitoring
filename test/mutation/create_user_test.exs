defmodule InvestmentMonitoring.CreateUserTest do
  use InvestmentMonitoring.ConnCase
  use Phoenix.ConnTest

  describe "Create User" do
    test "returns a user" do
      query = """
      mutation {
        createUser(password: "123456", username: "test", name: "Test") {
          id
          name
          username
        }
      }
      """
      conn = build_conn()
      |> put_req_header("content-type", "application/graphql")
      |> post("/graphql", query)

      assert json_response(conn, 200)["data"]["createUser"]["name"] == "Test"
    end
  end
end
