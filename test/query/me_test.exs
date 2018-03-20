defmodule InvestmentMonitoring.MeTest do
  use InvestmentMonitoring.ConnCase
  use Phoenix.ConnTest
  alias InvestmentMonitoring.User
  alias InvestmentMonitoring.Repo

  describe "me" do
    test "returns the logged user info" do
      changeset = User.registration_changeset(%User{}, %{username: "test", password: "123456", name: "Test"})

      {:ok, user} = Repo.insert(changeset)
      {:ok, token, _full_claims} = InvestmentMonitoring.Guardian.encode_and_sign(user)

      query = """
        query {
          me {
            id
            name
            username
          }
        }
      """

      conn = build_conn()
      |> put_req_header("content-type", "application/graphql")
      |> put_req_header("authorization", "Bearer #{token}")
      |> post("/graphql", query)

      assert json_response(conn, 200)["data"]["me"]["name"] == "Test"
    end
  end
end
