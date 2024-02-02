defmodule FieldsDemo.Repo.Migrations.CreateAttendees do
  use Ecto.Migration

  def change do
    create table(:attendees) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :phone_number, :string
      add :address_line_1, :string
      add :address_line_2, :string
      add :postcode, :string
      add :gender, :string
      add :diet_pref, :string
      add :website, :string
      add :desc, :string
      add :feedback, :string

      timestamps()
    end
  end
end
