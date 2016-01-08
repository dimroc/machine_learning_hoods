use Mix.Config

config :machine_learning_hoods, :machinelearning,
  ml_model_id: System.get_env("AWS_ML_MODEL_ID")

uri = URI.parse System.get_env("AWS_ML_PREDICTION_URL")
config :ex_aws, :machinelearning,
  scheme: "#{uri.scheme}://",
  host: uri.host,
  region: "us-east-1"
