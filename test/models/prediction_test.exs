defmodule MachineLearningHoods.PredictionTest do
  use ExUnit.Case, async: true
  alias MachineLearningHoods.Prediction

  test "#present?" do
    prediction = %Prediction{
      text: "What's going on?",
      neighborhood: "Tribeca",
      response: %{"Prediction" => %{"details" => %{"Algorithm" => "SGD",
            "PredictiveModelType" => "MULTICLASS"}, "predictedLabel" => "Tribeca",
          "predictedScores" => %{"Gramercy" => 0.013818848878145218,
            "Boerum Hill" => 3.190569259459153e-5,
            "Greenpoint" => 2.3136351956054568e-4}}
      }
    }

    assert Prediction.present?(prediction) == true
  end
end

