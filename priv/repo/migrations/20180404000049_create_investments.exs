defmodule InvestmentMonitoring.Repo.Migrations.CreateInvestments do
  use Ecto.Migration

  def change do
    create table(:investments) do
      add :broker, :string
      add :title, :string
      add :amount, :integer
      add :start_date, :date
      add :end_date, :date
      add :refence_rate, :string

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:investments, [:user_id])
  end
end
