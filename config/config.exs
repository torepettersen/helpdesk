import Config

# This should already have been added in the first
# getting started guide
config :helpdesk,
  ash_domains: [Helpdesk.Support]

config :helpdesk,
  ecto_repos: [Helpdesk.Repo]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
