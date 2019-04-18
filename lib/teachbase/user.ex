defmodule Teachbase.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :notification_settings, :map
  end
end
