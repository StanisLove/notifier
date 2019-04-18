defmodule Notifier.Utils do
  def get_module(namespace, name) do
    "Elixir.Notifier.#{namespace}." <> (
      name |> String.split("_") |> Enum.map(&String.capitalize/1) |> Enum.join()
    )
    |> String.to_existing_atom()
  end
end
