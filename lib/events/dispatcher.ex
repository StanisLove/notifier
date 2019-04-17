defmodule Notifier.Events.Dispatcher do
  def dispatch({type, payload} = data) do
    IO.inspect(data)

    module_name = "Elixir.Notifier.Events." <> (
      type |> String.split("_") |> Enum.map(&String.capitalize/1) |> Enum.join()
    )
    apply(String.to_existing_atom(module_name), :trigger, [payload])
  end
end
