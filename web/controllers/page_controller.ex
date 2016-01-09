defmodule MachineLearningHoods.PageController do
  use MachineLearningHoods.Web, :controller
  alias MachineLearningHoods.Prediction

  def index(conn, %{"q" => q}) do
    conn
    |> assign(:q, q)
    |> assign(:prediction, Prediction.predict(q))
    |> render "index.html"
  end

  def index(conn, _params) do
    q = "I love this hipster shit"
    index(conn, %{"q" => q})
  end
end
