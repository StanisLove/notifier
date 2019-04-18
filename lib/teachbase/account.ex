defmodule Teachbase.Account do
  use Ecto.Schema

  schema "accounts" do
    field :name, :string
  end
end
