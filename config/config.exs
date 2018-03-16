# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :investment_monitoring,
  ecto_repos: [InvestmentMonitoring.Repo]

# Configures the endpoint
config :investment_monitoring, InvestmentMonitoring.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R7KBfy9oPKHqD8w9xLyD1nhJSlBqV+Kdm/wcTu7H9GGgbOU11ggPDun9z6M1BwXz",
  render_errors: [view: InvestmentMonitoring.ErrorView, accepts: ~w(html json)],
  pubsub: [name: InvestmentMonitoring.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
