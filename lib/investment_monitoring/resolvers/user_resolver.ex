defmodule InvestmentMonitoring.UserResolver do
  alias InvestmentMonitoring.User
  alias InvestmentMonitoring.Repo

  def all_users(_root, _args, _info) do
    users = User.list_users()
    {:ok, users}
  end

  def create_user(_root, args, _info) do
    changeset = User.registration_changeset(%User{}, args)
    case Repo.insert(changeset) do
      {:ok, user} -> {:ok, user}
      {:error, reason} -> {:error, reason}
    end
  end
end
