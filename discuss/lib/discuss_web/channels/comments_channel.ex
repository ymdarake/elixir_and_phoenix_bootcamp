# https://hexdocs.pm/phoenix/channels.html#tying-it-all-together
defmodule DiscussWeb.CommentsChannel do
  use Phoenix.Channel
	alias Discuss.Repo
	alias Discuss.Topic

  def join("comments:" <> topic_id, _params, socket) do
		topic_id = String.to_integer(topic_id)
		topic = Repo.get(Topic, topic_id)
		IO.inspect topic
		{:ok, %{}, socket}
	end

	def handle_in(name, message, socket) do
		{:reply, :ok, socket}
	end
end
