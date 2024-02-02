defmodule FieldsDemo.Accounts.Attendee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attendees" do
    field :desc, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string
    field :address_line_1, :string
    field :address_line_2, :string
    field :postcode, :string
    field :gender, :string
    field :diet_pref, :string
    field :website, :string
    field :feedback, :string

    timestamps()
  end

  @doc false
  def changeset(attendee, attrs) do
    attendee
    |> cast(attrs, [:first_name, :last_name, :email, :phone_number, :address_line_1, :address_line_2, :postcode, :gender, :diet_pref, :website, :desc, :feedback])
    |> validate_required([:first_name, :last_name, :email, :phone_number, :address_line_1, :address_line_2, :postcode, :gender, :diet_pref, :website, :desc, :feedback])
  end
end
