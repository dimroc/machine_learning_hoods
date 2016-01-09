defmodule MachineLearningHoods.Prediction do
  @doc """
  Encapsulates functionality around retrieving an AWS
  Machine Learning (ML) Prediction.
  """

  def predict(nil), do: %{}
  def predict(""), do: %{}
  def predict(text) do
    record = %{"Text" => text}
    {:ok, prediction} = ExAws.MachineLearning.predict(record)
    prediction["Prediction"]
  end

  def present?(prediction) do
    Map.has_key?(prediction, "predictedLabel")
  end
end
