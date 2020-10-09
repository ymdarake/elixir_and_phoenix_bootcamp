# https://hexdocs.pm/phoenix/channels.html#tying-it-all-together
defmodule DiscussWeb.CommentsChannel do
  use Phoenix.Channel

  def join(name, _params, socket) do
		IO.puts("++++++++++")
		IO.puts(name)
		IO.puts("++++++++++")
		{:ok, %{hey: "there"}, socket}
	end

	def handle_in() do

	end
end
