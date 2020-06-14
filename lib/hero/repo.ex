defmodule Hero.Repo do
  use Ecto.Repo,
    otp_app: :hero,
    adapter: Ecto.Adapters.Postgres
end
