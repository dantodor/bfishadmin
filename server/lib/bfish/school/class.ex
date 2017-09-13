defmodule Bfish.School.Class do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bfish.School.Class


  schema "classes" do
    field :class_name, :string

    belongs_to :user, Bfish.School.User

    has_many :student , Bfish.School.Student
    
    timestamps()
  end

  @doc false
  def changeset(%Class{} = class, attrs) do
    class
    |> cast(attrs, [:class_name])
    |> validate_required([:class_name])
    |> foreign_key_constraint(:user)
  end
end
