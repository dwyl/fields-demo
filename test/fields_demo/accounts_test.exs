defmodule FieldsDemo.AccountsTest do
  use FieldsDemo.DataCase

  alias FieldsDemo.Accounts

  describe "attendees" do
    alias FieldsDemo.Accounts.Attendee

    import FieldsDemo.AccountsFixtures

    @invalid_attrs %{desc: nil, email: nil, first_name: nil, last_name: nil, phone_number: nil, address_line_1: nil, address_line_2: nil, postcode: nil, gender: nil, diet_pref: nil, website: nil, feedback: nil}

    test "list_attendees/0 returns all attendees" do
      attendee = attendee_fixture()
      assert Accounts.list_attendees() == [attendee]
    end

    test "get_attendee!/1 returns the attendee with given id" do
      attendee = attendee_fixture()
      assert Accounts.get_attendee!(attendee.id) == attendee
    end

    test "create_attendee/1 with valid data creates a attendee" do
      valid_attrs = %{desc: "some desc", email: "some email", first_name: "some first_name", last_name: "some last_name", phone_number: "some phone_number", address_line_1: "some address_line_1", address_line_2: "some address_line_2", postcode: "some postcode", gender: "some gender", diet_pref: "some diet_pref", website: "some website", feedback: "some feedback"}

      assert {:ok, %Attendee{} = attendee} = Accounts.create_attendee(valid_attrs)
      assert attendee.desc == "some desc"
      assert attendee.email == "some email"
      assert attendee.first_name == "some first_name"
      assert attendee.last_name == "some last_name"
      assert attendee.phone_number == "some phone_number"
      assert attendee.address_line_1 == "some address_line_1"
      assert attendee.address_line_2 == "some address_line_2"
      assert attendee.postcode == "some postcode"
      assert attendee.gender == "some gender"
      assert attendee.diet_pref == "some diet_pref"
      assert attendee.website == "some website"
      assert attendee.feedback == "some feedback"
    end

    test "create_attendee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_attendee(@invalid_attrs)
    end

    test "update_attendee/2 with valid data updates the attendee" do
      attendee = attendee_fixture()
      update_attrs = %{desc: "some updated desc", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone_number: "some updated phone_number", address_line_1: "some updated address_line_1", address_line_2: "some updated address_line_2", postcode: "some updated postcode", gender: "some updated gender", diet_pref: "some updated diet_pref", website: "some updated website", feedback: "some updated feedback"}

      assert {:ok, %Attendee{} = attendee} = Accounts.update_attendee(attendee, update_attrs)
      assert attendee.desc == "some updated desc"
      assert attendee.email == "some updated email"
      assert attendee.first_name == "some updated first_name"
      assert attendee.last_name == "some updated last_name"
      assert attendee.phone_number == "some updated phone_number"
      assert attendee.address_line_1 == "some updated address_line_1"
      assert attendee.address_line_2 == "some updated address_line_2"
      assert attendee.postcode == "some updated postcode"
      assert attendee.gender == "some updated gender"
      assert attendee.diet_pref == "some updated diet_pref"
      assert attendee.website == "some updated website"
      assert attendee.feedback == "some updated feedback"
    end

    test "update_attendee/2 with invalid data returns error changeset" do
      attendee = attendee_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_attendee(attendee, @invalid_attrs)
      assert attendee == Accounts.get_attendee!(attendee.id)
    end

    test "delete_attendee/1 deletes the attendee" do
      attendee = attendee_fixture()
      assert {:ok, %Attendee{}} = Accounts.delete_attendee(attendee)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_attendee!(attendee.id) end
    end

    test "change_attendee/1 returns a attendee changeset" do
      attendee = attendee_fixture()
      assert %Ecto.Changeset{} = Accounts.change_attendee(attendee)
    end
  end
end
