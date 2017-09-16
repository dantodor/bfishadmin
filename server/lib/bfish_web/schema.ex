
defmodule BfishWeb.Schema do
  use Absinthe.Schema


  import_types __MODULE__.SchoolTypes

  query do

    field :classes, list_of(:class) do
      resolve &BfishWeb.Resolvers.School.list_filtered_classes/3
    end

  end


  mutation do

    field :create_class, :class do
      arg :input, non_null(:class_input)
      resolve &BfishWeb.Resolvers.School.create_class/3
    end

    field :create_student, :student do
            arg :input, non_null(:student_input)
            resolve &BfishWeb.Resolvers.School.create_student/3
    end


    field :login_user, :user_session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &BfishWeb.Resolvers.School.login_user/3
    end


  end


end
