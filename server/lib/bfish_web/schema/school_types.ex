defmodule BfishWeb.Schema.SchoolTypes do
  use Absinthe.Schema.Notation

  alias BfishWeb.Resolvers

  object :user do
    args :nm, :string
    field :email, :string
    field :name, :string
    field :role, :string
    field :userid, :string
    field :classes, list_of(:class) do
      resolve &Resolvers.School.list_classes/3
    end
  end

  object :class do
    field :class_name, :string
    field :students, list_of(:student) do
      resolve &Resolvers.School.list_students/3
    end
  end

  object :student do
      field :average, :float
      field :fname, :string
      field :lname, :string
      field :login_name, :string
      field :password, :string
      field :stories, :integer
      field :total_hours, :integer
      field :week_hours, :integer
  end


end
