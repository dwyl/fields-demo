defmodule FieldsDemoWeb.AttendeeLiveTest do
  use FieldsDemoWeb.ConnCase

  import Phoenix.LiveViewTest
  import FieldsDemo.AccountsFixtures

  @create_attrs %{desc: "some desc", email: "some email", first_name: "some first_name", last_name: "some last_name", phone_number: "some phone_number", address_line_1: "some address_line_1", address_line_2: "some address_line_2", postcode: "some postcode", gender: "some gender", diet_pref: "some diet_pref", website: "some website", feedback: "some feedback"}
  @update_attrs %{desc: "some updated desc", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone_number: "some updated phone_number", address_line_1: "some updated address_line_1", address_line_2: "some updated address_line_2", postcode: "some updated postcode", gender: "some updated gender", diet_pref: "some updated diet_pref", website: "some updated website", feedback: "some updated feedback"}
  @invalid_attrs %{desc: nil, email: nil, first_name: nil, last_name: nil, phone_number: nil, address_line_1: nil, address_line_2: nil, postcode: nil, gender: nil, diet_pref: nil, website: nil, feedback: nil}

  defp create_attendee(_) do
    attendee = attendee_fixture()
    %{attendee: attendee}
  end

  describe "Index" do
    setup [:create_attendee]

    test "lists all attendees", %{conn: conn, attendee: attendee} do
      {:ok, _index_live, html} = live(conn, ~p"/attendees")

      assert html =~ "Listing Attendees"
      assert html =~ attendee.desc
    end

    test "saves new attendee", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/attendees")

      assert index_live |> element("a", "New Attendee") |> render_click() =~
               "New Attendee"

      assert_patch(index_live, ~p"/attendees/new")

      assert index_live
             |> form("#attendee-form", attendee: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#attendee-form", attendee: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/attendees")

      html = render(index_live)
      assert html =~ "Attendee created successfully"
      assert html =~ "some desc"
    end

    test "updates attendee in listing", %{conn: conn, attendee: attendee} do
      {:ok, index_live, _html} = live(conn, ~p"/attendees")

      assert index_live |> element("#attendees-#{attendee.id} a", "Edit") |> render_click() =~
               "Edit Attendee"

      assert_patch(index_live, ~p"/attendees/#{attendee}/edit")

      assert index_live
             |> form("#attendee-form", attendee: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#attendee-form", attendee: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/attendees")

      html = render(index_live)
      assert html =~ "Attendee updated successfully"
      assert html =~ "some updated desc"
    end

    test "deletes attendee in listing", %{conn: conn, attendee: attendee} do
      {:ok, index_live, _html} = live(conn, ~p"/attendees")

      assert index_live |> element("#attendees-#{attendee.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#attendees-#{attendee.id}")
    end
  end

  describe "Show" do
    setup [:create_attendee]

    test "displays attendee", %{conn: conn, attendee: attendee} do
      {:ok, _show_live, html} = live(conn, ~p"/attendees/#{attendee}")

      assert html =~ "Show Attendee"
      assert html =~ attendee.desc
    end

    test "updates attendee within modal", %{conn: conn, attendee: attendee} do
      {:ok, show_live, _html} = live(conn, ~p"/attendees/#{attendee}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Attendee"

      assert_patch(show_live, ~p"/attendees/#{attendee}/show/edit")

      assert show_live
             |> form("#attendee-form", attendee: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#attendee-form", attendee: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/attendees/#{attendee}")

      html = render(show_live)
      assert html =~ "Attendee updated successfully"
      assert html =~ "some updated desc"
    end
  end
end
