defmodule Notifier.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: Notifier.Router, options: [port: 8085])
      # Starts a worker by calling: Notifier.Worker.start_link(arg)
      # {Notifier.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Notifier.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
