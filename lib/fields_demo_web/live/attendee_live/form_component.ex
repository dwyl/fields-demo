defmodule FieldsDemoWeb.AttendeeLive.FormComponent do
  use FieldsDemoWeb, :live_component

  alias FieldsDemo.Accounts

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage attendee records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="attendee-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:first_name]} type="text" label="First name" />
        <.input field={@form[:last_name]} type="text" label="Last name" />
        <.input field={@form[:email]} type="text" label="Email" />
        <.input field={@form[:phone_number]} type="text" label="Phone number" />
        <.input field={@form[:address_line_1]} type="text" label="Address line 1" />
        <.input field={@form[:address_line_2]} type="text" label="Address line 2" />
        <.input field={@form[:postcode]} type="text" label="Postcode" />
        <.input field={@form[:gender]} type="text" label="Gender" />
        <.input field={@form[:diet_pref]} type="text" label="Diet pref" />
        <.input field={@form[:website]} type="text" label="Website" />
        <.input field={@form[:desc]} type="text" label="Desc" />
        <.input field={@form[:feedback]} type="text" label="Feedback" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Attendee</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{attendee: attendee} = assigns, socket) do
    changeset = Accounts.change_attendee(attendee)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"attendee" => attendee_params}, socket) do
    changeset =
      socket.assigns.attendee
      |> Accounts.change_attendee(attendee_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"attendee" => attendee_params}, socket) do
    save_attendee(socket, socket.assigns.action, attendee_params)
  end

  defp save_attendee(socket, :edit, attendee_params) do
    case Accounts.update_attendee(socket.assigns.attendee, attendee_params) do
      {:ok, attendee} ->
        notify_parent({:saved, attendee})

        {:noreply,
         socket
         |> put_flash(:info, "Attendee updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_attendee(socket, :new, attendee_params) do
    case Accounts.create_attendee(attendee_params) do
      {:ok, attendee} ->
        notify_parent({:saved, attendee})

        {:noreply,
         socket
         |> put_flash(:info, "Attendee created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
