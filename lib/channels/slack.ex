defmodule Notifier.Channels.Slack do
  def deliver(%{settings: %{"webhook" => webhook}}, text) do
    HTTPoison.post webhook, Poison.encode!(%{text: text})
  end
end
