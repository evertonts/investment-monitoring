# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     InvestmentMonitoring.Repo.insert!(%InvestmentMonitoring.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

alias InvestmentMonitoring.User
alias InvestmentMonitoring.Repo

%User{name: "Everton", password: "123", username: "everton"} |> Repo.insert
