require IEx

defmodule InvestmentMonitoring.InvestmentResolver do
  alias InvestmentMonitoring.Repo
  alias InvestmentMonitoring.Investment

  def create_investment(_root, args, %{context: context}) do
    user = context.current_user
    changeset = user |> Ecto.build_assoc(:investments) |> Investment.changeset(args)

    Repo.insert(changeset)
  end
end
