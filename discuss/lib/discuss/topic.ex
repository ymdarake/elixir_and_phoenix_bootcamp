defmodule Discuss.Topic do
  use Ecto.Repo,
      otp_app: :discuss,
      adapter: Ecto.Adapters.Postgres
  use Ecto.Schema
  import Ecto.Changeset


  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
