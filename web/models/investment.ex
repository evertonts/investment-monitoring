defmodule InvestmentMonitoring.Investment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "investments" do
    field :broker, :string
    field :title, :string
    field :amount, :integer
    field :start_date, :date
    field :end_date, :date
    field :reference_rate, :string

    belongs_to :user, InvestmentMonitoring.User
    timestamps()
  end

  @doc false
  def changeset(investment, attrs) do
    investment
    |> cast(attrs, ~w(broker title amount start_date end_date reference_rate))
    |> validate_required([:broker])
  end
end
