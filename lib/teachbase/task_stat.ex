defmodule Teachbase.TaskStat do
  use Ecto.Schema

  schema "task_stats" do
    field :success, :boolean

    belongs_to :course, Teachbase.Course
    belongs_to :task,   Teachbase.Task
    belongs_to :user,   Teachbase.User
  end
end
