# https://hexdocs.pm/phoenix/channels.html#tying-it-all-together
defmodule DiscussWeb.CommentsChannel do
  use Phoenix.Channel
	alias Discuss.Repo
	alias Discuss.{Topic, Comment}

  def join("comments:" <> topic_id, _params, socket) do
		topic_id = String.to_integer(topic_id)
		topic = Topic
			|> Repo.get(topic_id)
			|> Repo.preload(:comments)

		{:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
	end

	def handle_in(_name, %{"content" => content}, socket) do
		topic = socket.assigns.topic
		changeset = topic
			|> Ecto.build_assoc(:comments)
			|> Comment.changeset(%{content: content})

		case Repo.insert(changeset) do
			{:ok, _comment } ->
				{:reply, :ok, socket}
			{:error, _reason} ->
				{:reply, {:error, %{errors: changeset}}, socket}
		end
	end
end
