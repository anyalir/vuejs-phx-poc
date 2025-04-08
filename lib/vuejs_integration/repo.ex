defmodule VuejsIntegration.Repo do
  use Ecto.Repo,
    otp_app: :vuejs_integration,
    adapter: Ecto.Adapters.Postgres
end
