defmodule Notifier.Events.Dispatcher do
  alias Notifier.Utils

  def dispatch({event, payload} = data) do
    Utils.get_module("Events", event) |> apply(:trigger, [payload])
  end
end
