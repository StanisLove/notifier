defmodule Notifier.Events.Listener do
  use GenServer

  alias Notifier.Events.Dispatcher

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, pubsub} = Redix.PubSub.start_link(host: "localhost", port: 6379, database: 0)
    Redix.PubSub.subscribe(pubsub, "events", self())

    {:ok, nil}
  end

  def handle_info(
    {:redix_pubsub, _pubsub, _ref, :message, %{channel: "events", payload: payload}}, state
  ) do
    Task.start(fn ->
      payload
      |> Poison.decode!
      |> Map.pop("type")
      |> Dispatcher.dispatch()
    end)

    {:noreply, state}
  end

  def handle_info(_msg, state), do: {:noreply, state}
end
