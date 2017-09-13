defmodule Bfish.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :login_name, :string
      add :password, :string
      add :fname, :string
      add :lname, :string
      add :stories, :integer
      add :total_hours, :integer
      add :week_hours, :integer
      add :average, :float
      add :class_id, references(:classes, on_delete: :nothing)

      timestamps()
    end

    create index(:students, [:class_id])
  end
end
