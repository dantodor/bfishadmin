
defmodule BfishWeb.Schema do
  use Absinthe.Schema


  import_types __MODULE__.SchoolTypes

  query do

    field :users, list_of(:user) do
      resolve &BfishWeb.Resolvers.School.users/3
    end


  end


end
