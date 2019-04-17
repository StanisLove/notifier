defmodule Notifier.Events.TaskChecked do
  def trigger(input) do
    IO.puts("Trigger event")
    IO.inspect(input)
  end
end
