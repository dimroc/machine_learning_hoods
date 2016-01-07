# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :machine_learning_hoods, MachineLearningHoods.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "rUEi5K86IH1i0dQHoXoz22CCdodqqpqzdFCz6KW1v9GPudOZDWUFoYmGoISTaUHZ",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: MachineLearningHoods.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Configure phoenix template engines
config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine
