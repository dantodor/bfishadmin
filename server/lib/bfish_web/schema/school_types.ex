defmodule BfishWeb.Schema.SchoolTypes do
  use Absinthe.Schema.Notation

  alias BfishWeb.Resolvers

  object :user_session do
    field :token, :string
    field :user, :user
  end


  object :classlist do
    field :classes, list_of(:class) do
      resolve &Resolvers.School.list_filtered_classes/3
    end
  end

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



#  object :user_red do
#    field :name, :string
#    field :email, :string
#    field :id, :string
#  end


  input_object :class_input do
    field :class_name, non_null(:string)
    field :user_id, non_null(:integer)
  end


  input_object :student_input do
    field :fname, non_null(:string)
    field :lname, non_null(:string)
    field :login_name, non_null(:string)
    field :password, non_null(:string)
    field :class_id, non_null(:integer)
  end

end
