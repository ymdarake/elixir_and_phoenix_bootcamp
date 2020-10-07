defmodule Discuss.User do
  use Ecto.Repo,
      otp_app: :discuss,
      adapter: Ecto.Adapters.Postgres
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
