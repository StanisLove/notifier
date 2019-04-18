defmodule Notifier.Events.TaskChecked do
  alias Teachbase.{Repo, User, TaskStat}
  alias Notifier.Events.Renderer
  alias Notifier.Utils

  def trigger(%{"task_stat_id" => stat_id}) do
    task_stat = Repo.get(TaskStat, stat_id) |> Repo.preload([:task, :course, :user])
    user      = task_stat.user

    text = Notifier.Events.Renderer.task_checked(
      task_stat.course.name, task_stat.task.name, task_stat.success
    )

    user.notification_settings
    |> Enum.each(&(send_notification(&1, text)))
  end

  defp send_notification({channel, settings}, text) do
    Utils.get_module("Channels", channel) |> apply(:deliver, [%{settings: settings}, text])
  end
end
