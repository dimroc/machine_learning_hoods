defmodule MachineLearningHoods.Prediction do
  use MachineLearningHoods.Web, :model
  alias MachineLearningHoods.Prediction

  @doc """
  Encapsulates functionality around retrieving an AWS
  Machine Learning (ML) Prediction.
  """

  schema "predictions" do
    field :text, :string
    field :neighborhood, :string
    field :response, :map

    timestamps
  end

  @required_fields ~w(text neighborhood)
  @optional_fields ~w(response)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def predict(nil), do: %Prediction{}
  def predict(""), do: %Prediction{}
  def predict(text) do
    record = %{"Text" => text}
    {:ok, response} = ExAws.MachineLearning.predict(record)

    %Prediction{
      text: text,
      neighborhood: response["Prediction"]["predictedLabel"],
      response: response
    }
  end

  def present?(prediction) do
    Map.has_key?(prediction, :neighborhood)
  end
end
