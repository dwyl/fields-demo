defmodule FieldsDemo.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FieldsDemo.Accounts` context.
  """

  @doc """
  Generate a attendee.
  """
  def attendee_fixture(attrs \\ %{}) do
    {:ok, attendee} =
      attrs
      |> Enum.into(%{
        desc: "some desc",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        phone_number: "some phone_number",
        address_line_1: "some address_line_1",
        address_line_2: "some address_line_2",
        postcode: "some postcode",
        gender: "some gender",
        diet_pref: "some diet_pref",
        website: "some website",
        feedback: "some feedback"
      })
      |> FieldsDemo.Accounts.create_attendee()

    attendee
  end
end
