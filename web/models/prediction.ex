defmodule MachineLearningHoods.Prediction do
  @doc """
  Encapsulates functionality around retrieving an AWS
  Machine Learning (ML) Prediction.
  """

  def predict(nil), do: %{}
  def predict(""), do: %{}
  def predict(text) do
    model_id = Application.get_env(:machine_learning_hoods, :machinelearning)[:ml_model_id]
    record = %{"Text" => text}
    {:ok, prediction} = ExAws.MachineLearning.predict(model_id, record)
    prediction["Prediction"]
  end

  def present?(prediction) do
    Map.has_key?(prediction, "predictedLabel")
  end
end
