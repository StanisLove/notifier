defmodule Notifier.Events.Notification do
  require EEx
  EEx.function_from_file(:def, :task_checked, "lib/events/templates/task_checked.eex", [:task_name, :course_name, :success])
end
