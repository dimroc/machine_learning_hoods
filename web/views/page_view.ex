defmodule MachineLearningHoods.PageView do
  use MachineLearningHoods.Web, :view
  alias MachineLearningHoods.Prediction

  def score_rows(prediction) do
    hash = prediction.response["Prediction"]
    rows = for { hood, value } <- hash["predictedScores"] do
      {"Other", hood, value}
    end

    Enum.sort(rows, &score_sort/2)
  end

  defp score_sort(first, second) do
    {_, _, score1} = first
    {_, _, score2} = second
    score1 > score2
  end
end
