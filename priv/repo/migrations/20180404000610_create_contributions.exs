defmodule InvestmentMonitoring.Repo.Migrations.CreateContributions do
  use Ecto.Migration

  def change do
    create table(:contributions) do
      add :title, :string
      add :amount, :integer
      add :date, :date
      add :investment_id, references(:investments, on_delete: :delete_all)

      timestamps()
    end

    create index(:contributions, [:investment_id])
  end
end
