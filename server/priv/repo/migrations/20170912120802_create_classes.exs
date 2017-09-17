defmodule Bfish.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :clss_name, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:classes, [:user_id])
  end
end
