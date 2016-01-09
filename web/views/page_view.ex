defmodule MachineLearningHoods.PageView do
  use MachineLearningHoods.Web, :view
  alias MachineLearningHoods.Prediction

  def prediction_rows(prediction) do
    rows = for { hood, value } <- prediction["predictedScores"] do
      {"Other", hood, value}
    end

    Enum.sort(rows, &prediction_sort/2)
  end

  defp prediction_sort(first, second) do
    {_, _, score1} = first
    {_, _, score2} = second
    score1 > score2
  end
end
