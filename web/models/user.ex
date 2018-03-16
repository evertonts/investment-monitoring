defmodule InvestmentMonitoring.User do
  use InvestmentMonitoring.Web, :model

  alias InvestmentMonitoring.Repo
  alias InvestmentMonitoring.User

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps()
  end

  def list_users do
    Repo.all(User)
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 1, max: 20)
  end
end
