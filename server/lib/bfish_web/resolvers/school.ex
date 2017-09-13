defmodule BfishWeb.Resolvers.School do

  alias Bfish.School

  def list_classes(user, _, _) do
    {:ok, School.list_classes_for_user(user)}
  end

  def list_students(class, _, _) do
    {:ok, School.list_students_for_class(class)}
  end

  def users(_, args, _) do
    {:ok,School.list_users(args)}
  end

  #  def hotels_for_city(city, %{hf: name},_) when is_binary(name) do
  #    query = Ecto.assoc(city, :hotel)
  #    {:ok, Bfish.Repo.all(h in query, where: h.name==name, select h)}
  #  end

#  def hotels_for_city(city, args, _) do
#    # query = Ecto.assoc(city, :hotel)
#    {:ok, Booking.list_hotels_for_city(city,args)}
#  end



end