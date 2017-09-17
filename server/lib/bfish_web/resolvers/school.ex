defmodule BfishWeb.Resolvers.School do

  import Ecto.Query, warn: false
  alias Bfish.Repo
  alias Comeonin.Ecto.Password
  alias Bfish.School
  alias Bfish.School.User
  alias Bfish.School.Student

  def list_classes(user, _, _) do
    {:ok, School.list_classes_for_user(user)}
  end

  def list_filtered_classes(_, _, %{context: context}) do
    case context do
      %{current_user: %{id: uid}} ->
        classes_for_user(uid)
      _ ->
        {:error, "unauthorized"}
      end
  end


  def classes_for_user(uud) do
     case School.lookup(uud) do
      {:ok, us_r} -> {:ok, School.list_classes_for_user(us_r)}
      _ -> {:error, "unauthorized"}
     end
  end

  def list_students(class, _, _) do
    {:ok, School.list_students_for_class(class)}
  end

  def users(_, args, _) do
    {:ok,School.list_users(args)}
  end

  def create_class(_, %{input: params}, %{context: context}) do
    case context do
      %{current_user: %{id: uid}} ->
        case School.create_class(Map.put(params,:user_id,uid)) do
          {:error, _} ->
            {:error, "Could not create class"}
          {:ok, _} = success ->
            success
        end
      _ ->
        {:error, "unauthorized"}
    end

  end


  def create_student(_, %{input: params}, _) do
    mod_params = Map.put(params,:class_id,params[:clss_id])
    case School.create_student(mod_params) do
      {:error, _} ->
        {:error, "Could not create student"}
      {:ok, _} = success ->
        success
    end
  end

  def update_student(_, %{input: params}, _) do
    student = Repo.get!(Student,params[:id])
    mod_params = Map.delete(params,:id)
    case School.update_student(student, mod_params) do
      {:error, _} ->
        {:error, "Could not update student"}
      {:ok, _} = success ->
        success
    end
  end

  def login_user(_, %{email: email, password: password}, _) do
    case authenticate(email, password) do
      {:ok, user} ->
        token = BfishWeb.Authentication.sign(%{
          id: user.id
        })
        {:ok, %{token: token, user: user}}
      _ ->
        {:error, "incorrect email or password"}
    end
  end

  defp authenticate(email, password) do
    user = Repo.get_by(User, email: email)
    with %{password: digest} <- user,
         true <- Password.valid?(password, digest) do
      {:ok, user}
    else
      _ -> :error
    end
  end



end