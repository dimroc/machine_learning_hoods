defmodule MachineLearningHoods.IntegrationPredictionTest do
  use ExUnit.Case, async: true
  alias MachineLearningHoods.Prediction

  test "#predict" do
    actual = Prediction.predict("What is going on?")
    assert Prediction.present? actual
  end
end

