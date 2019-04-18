defmodule Notifier.Channels.Slack do
  def deliver(text, %{settings: %{"webhook" => webhook}}) do
    HTTPoison.post webhook, Poison.encode!(%{text: text})
  end

  def test(text) do
    deliver text, %{"webhook" => "https://hooks.slack.com/services/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"}
  end
end
