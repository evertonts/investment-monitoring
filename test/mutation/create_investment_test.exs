defmodule InvestmentMonitoring.CreateInvestmentTest do
  use InvestmentMonitoring.ConnCase
  use Phoenix.ConnTest
  alias InvestmentMonitoring.User

  describe "Create Investment mutation" do
    test "creates a new investment" do
      changeset = User.registration_changeset(%User{}, %{username: "test", password: "123456", name: "Test"})

      {:ok, user} = Repo.insert(changeset)
      {:ok, token, _full_claims} = InvestmentMonitoring.Guardian.encode_and_sign(user)

      query = """
        mutation {
          createInvestment(broker: "test", title: "First investment",
            amount: 100, start_date: "2018-01-01", end_date: "2018-12-01",
            reference_rate: "CDI"
          ) {
            id
          }
        }
      """

      conn = build_conn()
      |> put_req_header("content-type", "application/graphql")
      |> put_req_header("authorization", "Bearer #{token}")
      |> post("/graphql", query)

      assert json_response(conn, 200)["data"]["createInvestment"]["id"] != nil
    end
  end
end
