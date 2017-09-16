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



ravi = %School.User{name: "Ravi",userid: "ravi",
         email: "ravi@brightfishlearning.com", password: "ravi", role: "admin"} |> Repo.insert!

class1 =
  %School.Class {class_name: "Ravi's class", user: ravi}
  |> Repo.insert!

kid1 = %School.Student{login_name: "anagha", fname: "Anagha", lname: "Ramsaran", password: "anagha",
          stories: 3, total_hours: 45, average: 67.0, class: class1} |> Repo.insert!

kid2 = %School.Student{login_name: "krrish", fname: "Krrish", lname: "Ramsaran", password: "krrish",
  stories: 5, total_hours: 20, average: 82.0, class: class1} |> Repo.insert!

