# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :notifier, Teachbase.Repo,
  database: "teachbase",
  username: "teachbase",
  password: "teachbase",
  hostname: "localhost"

config :postgrex, :json_library, Poison

import_config "config.secret.exs"
# config :teachbase, ecto_repos: [Teachbase.Repo]
