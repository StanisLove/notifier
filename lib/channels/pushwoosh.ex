defmodule Notifier.Channels.Pushwoosh do
  @api_url "https://cp.pushwoosh.com/json/1.3/createMessage"

  def deliver(_settings, text) do
    HTTPoison.post @api_url, Poison.encode!(%{
      request: %{
        application:   Application.get_env(:notifier, :pushwoosh_app_code),
        auth:          Application.get_env(:notifier, :pushwoosh_token),
        notifications: [%{
          send_date: "now",
          platforms: [11],
          content:   text
        }]
      }
    }), [{"Content-Type", "application/json"}]
  end
end
