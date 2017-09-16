defmodule Bfish.School do
  @moduledoc """
  The School context.
  """
  import Ecto.Query, warn: false
  alias Bfish.Repo
  alias Bfish.School.Student
  alias Bfish.School.Class
  alias Comeonin.Ecto.Password
  alias Bfish.School.User


  def authenticate(role, email, password) do
    user = Repo.get_by(User, role: role, email: email)
    with %{password: digest} <- user,
         true <- Password.valid?(password, digest) do
      {:ok, user}
    else
      _ -> :error
    end
  end

  def list_users(_) do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end



  def list_classes(_) do
    Repo.all(Class)
  end

  def get_class!(id), do: Repo.get!(Class, id)

  def create_class(attrs \\ %{}) do
    %Class{}
    |> Class.changeset(attrs)
    |> Repo.insert()
  end

  def update_class(%Class{} = class, attrs) do
    class
    |> Class.changeset(attrs)
    |> Repo.update()
  end

  def delete_class(%Class{} = class) do
    Repo.delete(class)
  end

  def change_class(%Class{} = class) do
    Class.changeset(class, %{})
  end


  def list_students(_) do
    Repo.all(Student)
  end

  def get_student!(id), do: Repo.get!(Student, id)

  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  def update_student(%Student{} = student, attrs) do
    student
    |> Student.changeset(attrs)
    |> Repo.update()
  end

  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end

  def change_student(%Student{} = student) do
    Student.changeset(student, %{})
  end

  # links
  def list_classes_for_user(user) do
    Ecto.assoc(user, :class) |> Repo.all
  end

  def list_students_for_class(class) do
    Ecto.assoc(class, :student) |> Repo.all
  end

  def lookup(id) do
    IO.inspect(id)
    {:ok,Repo.get_by(User, id: id)}
  end




end
