defmodule Notifier.MixProject do
  use Mix.Project

  def project do
    [
      app: :notifier,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :poison],
      mod: {Notifier.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.5"},
      {:plug_cowboy, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.4"},
      {:redix, ">= 0.0.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
