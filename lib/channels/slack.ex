defmodule Notifier.Channels.Slack do
  def deliver(%{settings: %{"webhook" => webhook}}, text) do
    HTTPoison.post webhook, Poison.encode!(%{text: text})
  end

  def test(text) do
    deliver %{settings: %{"webhook" => "https://hooks.slack.com/services/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"}}, text
  end
end
