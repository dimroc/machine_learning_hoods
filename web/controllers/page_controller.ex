defmodule MachineLearningHoods.PageController do
  use MachineLearningHoods.Web, :controller
  alias MachineLearningHoods.Prediction
  alias MachineLearningHoods.Repo

  def index(conn, %{"q" => q}) do
    prediction = Prediction.predict(q)
    Task.async(fn -> save_prediction(prediction) end)

    conn
    |> assign(:q, q)
    |> assign(:prediction, prediction)
    |> render("index.html")
  end

  def index(conn, _params) do
    q = "I love this hipster shit"
    index(conn, %{"q" => q})
  end

  defp save_prediction(prediction) do
    Repo.insert(prediction)
  end
end
