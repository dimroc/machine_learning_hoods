defmodule MachineLearningHoods.Repo.Migrations.CreatePrediction do
  use Ecto.Migration

  def change do
    create table(:predictions) do
      add :text, :text
      add :neighborhood, :string
      add :response, :map

      timestamps
    end
  end
end
