defmodule Notifier.Events.Renderer do
  require EEx

  EEx.function_from_file(:def, :task_checked_markdown, "lib/events/templates/task_checked.md.eex", [:presenter])
  EEx.function_from_file(:def, :task_checked_plain, "lib/events/templates/task_checked.txt.eex", [:presenter])

  def call(%Notifier.Events.TaskChecked{} = presenter, channel) do
    case channel do
      "pushwoosh" -> task_checked_plain(presenter)
      "telegram"  -> task_checked_markdown(presenter)
    end
  end
end
