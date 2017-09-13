defmodule Bfish.School.Student do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bfish.School.Student


  schema "students" do
    field :average, :float
    field :fname, :string
    field :lname, :string
    field :login_name, :string
    field :password, :string
    field :stories, :integer
    field :total_hours, :integer
    field :week_hours, :integer

    belongs_to :class, Bfish.School.Class

    timestamps()
  end

  @doc false
  def changeset(%Student{} = students, attrs) do
    students
    |> cast(attrs, [:login_name, :password, :fname, :lname, :stories, :total_hours, :week_hours, :average])
    |> validate_required([:login_name, :password, :fname, :lname, :stories, :total_hours, :week_hours, :average])
    |> foreign_key_constraint(:class)
  end
end
