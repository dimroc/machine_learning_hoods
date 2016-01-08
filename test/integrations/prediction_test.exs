defmodule MachineLearningHoods.IntegrationPredictionTest do
  use ExUnit.Case, async: true
  alias MachineLearningHoods.Prediction

  test "#predict" do
    actual = Prediction.predict("What is going on?")
    assert Map.has_key?(actual, "predictedLabel")
  end
end

