defmodule Teachbase.Course do
  use Ecto.Schema

  schema "courses" do
    field :name, :string
  end
end
