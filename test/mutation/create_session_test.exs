defmodule InvestmentMonitoring.CreateSessionTest do
  use InvestmentMonitoring.ConnCase
  use Phoenix.ConnTest
  alias InvestmentMonitoring.User
  alias InvestmentMonitoring.Repo

  setup do
    changeset = User.registration_changeset(%User{}, %{username: "test", password: "123456", name: "Test"})
    Repo.insert(changeset)
    :ok
  end

  describe "Create a session" do
    test "returns a token" do
      query = """
      mutation {
        createSession(password: "123456", username: "test") {
          token
        }
      }
      """
      conn = build_conn()
      |> put_req_header("content-type", "application/graphql")
      |> post("/graphql", query)

      assert json_response(conn, 200)["data"]["createSession"]["token"] != nil
    end
  end
end
