# https://hexdocs.pm/phoenix/channels.html#tying-it-all-together
defmodule DiscussWeb.CommentsChannel do
  use Phoenix.Channel

  def join(name, _params, socket) do
		{:ok, %{hey: "there"}, socket}
	end

	def handle_in(name, message, socket) do
		IO.puts("+++++++")
		IO.puts(name)
		IO.inspect(message)
		IO.puts("+++++++")
		{:reply, :ok, socket}
	end
end
