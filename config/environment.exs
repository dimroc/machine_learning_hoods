use Mix.Config
require Logger

prediction_url = System.get_env("AWS_ML_PREDICTION_URL")
model_id = System.get_env("AWS_ML_MODEL_ID")

if prediction_url && model_id do
  uri = URI.parse prediction_url
  config :ex_aws, :machinelearning,
    scheme: "#{uri.scheme}://",
    host: uri.host,
    region: "us-east-1",
    model_id: model_id
else
  Logger.warn "No AWS ML Real-Time Endpoint or ML Model ID found (AWS_ML_PREDICTION_URL, AWS_ML_MODEL_ID)"
end
