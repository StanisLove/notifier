defmodule Notifier.Events.TaskChecked do
  alias Teachbase.{Repo, TaskStat}
  alias Notifier.Events.Renderer
  alias Notifier.Utils

  @enforce_keys [:course_name, :task_name, :success?, :url]
  defstruct [:course_name, :task_name, :success?, :url]

  def trigger(%{"task_stat_id" => stat_id, "url" => url}) do
    task_stat = Repo.get(TaskStat, stat_id) |> Repo.preload([:task, :course, :user])
    user      = task_stat.user

    presenter = %__MODULE__{
      course_name: task_stat.course.name,
      task_name:   task_stat.task.name,
      success?:    task_stat.success,
      url:         url
    }

    user.notification_settings
    |> Enum.each(fn {channel, settings} ->
      meta = settings |> Map.merge(%{
        "url" => url, "users" => [Integer.to_string(user.id)]
      })

      Renderer.call(presenter, channel) |> send_notification(channel, meta)
    end)
  end

  defp send_notification(text, channel, meta) do
    Utils.get_module("Channels", channel) |> apply(:deliver, [text, meta])
  end
end
