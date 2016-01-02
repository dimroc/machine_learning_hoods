defmodule MachineLearningHoods.PageController do
  use MachineLearningHoods.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
