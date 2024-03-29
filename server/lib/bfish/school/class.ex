defmodule Bfish.School.Class do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bfish.School.Class


  schema "classes" do
    field :clss_name, :string

    belongs_to :user, Bfish.School.User

    has_many :student , Bfish.School.Student

    timestamps()
  end

  @doc false
  def changeset(%Class{} = class, attrs) do
    class
    |> cast(attrs, [:clss_name,:user_id])
    |> validate_required([:clss_name])
    |> foreign_key_constraint(:user)
  end
end
