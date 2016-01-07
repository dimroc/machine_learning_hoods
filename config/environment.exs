use Mix.Config

config :machine_learning_hoods, :ml,
  predict_endpoint: System.get_env("AWS_ML_PREDICTION_URL"),
  ml_model_id: System.get_env("AWS_ML_MODEL_ID")
