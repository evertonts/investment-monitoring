defmodule InvestmentMonitoring.Investment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "investments" do
    field :broker, :string
    belongs_to :user, InvestmentMonitoring.User
    has_many :contributions, InvestmentMonitoring.Contribution
    timestamps()
  end

  @doc false
  def changeset(investment, attrs) do
    investment
    |> cast(attrs, [:broker])
    |> validate_required([:broker])
  end
end
