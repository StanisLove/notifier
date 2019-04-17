defmodule Notifier.Events.Listener do
  alias Notifier.Events.Dispatcher

  def start do
    {:ok, pubsub} = Redix.PubSub.start_link(host: "localhost", port: 6379, database: 0)
    {:ok, ref}    = Redix.PubSub.subscribe(pubsub, "events", self())
    listen(pubsub, ref)
  end

  def listen(pubsub, ref) do
    receive do
      {:redix_pubsub, ^pubsub, ^ref, :message, %{channel: "events", payload: payload}} ->
        Task.start(fn ->
          payload
          |> Poison.decode!
          |> Map.pop("type")
          |> Dispatcher.dispatch()
        end)
    end
    listen(pubsub, ref)
  end
end
