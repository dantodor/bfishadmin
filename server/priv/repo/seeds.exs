# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bfish.Repo.insert!(%Bfish.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Bfish.{School, Repo}



#ravi = %School.User{name: "Ravi",userid: "ravi",
#         email: "ravi@brightfishlearning.com", password: "ravi", role: "admin"} |> Repo.insert!

ravi = %Bfish.School.User{} |> Bfish.School.User.changeset(%{name: "Ravi",userid: "ravi",email: "ravi@gmail.com",
  password: "ravi", role: "admin"}) |> Bfish.Repo.insert!

class1 =
  %School.Class {clss_name: "Ravi's class", user: ravi}
  |> Repo.insert!

kid1 = %School.Student{login_name: "anagha", fname: "Anagha", lname: "Ramsaran", password: "anagha",
          stories: 3, week_hours: 10, total_hours: 45, average: 67.0, class: class1} |> Repo.insert!

kid2 = %School.Student{login_name: "krrish", fname: "Krrish", lname: "Ramsaran", password: "krrish",
  stories: 5, week_hours: 5, total_hours: 20, average: 82.0, class: class1} |> Repo.insert!


class2 =
  %School.Class {clss_name: "Ravi's second class", user: ravi}
  |> Repo.insert!

kid3 = %School.Student{login_name: "dan", fname: "Dan", lname: "Todor", password: "dan",
         stories: 3, week_hours: 10, total_hours: 45, average: 67.0, class: class2} |> Repo.insert!

kid4 = %School.Student{login_name: "tibi", fname: "Tibor", lname: "Csuka", password: "tibi",
         stories: 5, week_hours: 5, total_hours: 20, average: 82.0, class: class2} |> Repo.insert!

