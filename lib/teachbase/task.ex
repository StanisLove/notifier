defmodule Teachbase.Task do
  use Ecto.Schema

  schema "tasks" do
    field :name, :string
  end
end
