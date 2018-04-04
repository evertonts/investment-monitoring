defmodule InvestmentMonitoring.Contribution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contributions" do
    field :amount, Money.Ecto.Type
    field :date, :date
    field :title, :string
    belongs_to :investment, InvestmentMonitoring.Investment

    timestamps()
  end

  @doc false
  def changeset(contribution, attrs) do
    contribution
    |> cast(attrs, [:title, :amount, :date])
    |> validate_required([:title, :amount, :date])
  end
end
