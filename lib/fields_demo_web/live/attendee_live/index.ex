defmodule FieldsDemoWeb.AttendeeLive.Index do
  use FieldsDemoWeb, :live_view

  alias FieldsDemo.Accounts
  alias FieldsDemo.Accounts.Attendee

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :attendees, Accounts.list_attendees())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Attendee")
    |> assign(:attendee, Accounts.get_attendee!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Attendee")
    |> assign(:attendee, %Attendee{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Attendees")
    |> assign(:attendee, nil)
  end

  @impl true
  def handle_info({FieldsDemoWeb.AttendeeLive.FormComponent, {:saved, attendee}}, socket) do
    {:noreply, stream_insert(socket, :attendees, attendee)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    attendee = Accounts.get_attendee!(id)
    {:ok, _} = Accounts.delete_attendee(attendee)

    {:noreply, stream_delete(socket, :attendees, attendee)}
  end
end
