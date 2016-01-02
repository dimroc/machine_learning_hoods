ExUnit.start

Mix.Task.run "ecto.create", ~w(-r MachineLearningHoods.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r MachineLearningHoods.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(MachineLearningHoods.Repo)

