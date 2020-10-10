# https://hexdocs.pm/phoenix/channels.html#tying-it-all-together
defmodule DiscussWeb.CommentsChannel do
  use Phoenix.Channel

  def join(name, _params, socket) do
		IO.puts name
		{:ok, %{hey: "there"}, socket}
	end

	def handle_in(name, message, socket) do
		{:reply, :ok, socket}
	end
end
