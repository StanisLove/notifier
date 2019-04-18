defmodule Teachbase.Repo do
  use Ecto.Repo,
    otp_app: :notifier,
    adapter: Ecto.Adapters.Postgres
end
