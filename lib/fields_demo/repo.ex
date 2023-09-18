defmodule FieldsDemo.Repo do
  use Ecto.Repo,
    otp_app: :fields_demo,
    adapter: Ecto.Adapters.Postgres
end
