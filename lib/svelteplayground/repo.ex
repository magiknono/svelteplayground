defmodule Svelteplayground.Repo do
  use Ecto.Repo,
    otp_app: :svelteplayground,
    adapter: Ecto.Adapters.Postgres
end
