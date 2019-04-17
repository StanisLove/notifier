defmodule Notifier.Channels.Telegram do
  @basic_url "https://api.telegram.org/bot#{Application.get_env(:notifier, :telegram_bot_token)}/"

  def deliver(%{settings: %{"chat_id" => chat_id}}, text) do
    # 146929765
    HTTPoison.post construct_url("sendMessage"),
      Poison.encode!(%{chat_id: chat_id, text: text}),
      [{"Content-Type", "application/json"}]
  end

  def test(text) do
    deliver %{settings: %{"chat_id" => -354449846}}, text
  end

  defp construct_url(url) do
    @basic_url <> url
  end
end
