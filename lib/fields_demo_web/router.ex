defmodule FieldsDemoWeb.Router do
  use FieldsDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FieldsDemoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", FieldsDemoWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/attendees", AttendeeLive.Index, :index
    live "/attendees/new", AttendeeLive.Index, :new
    live "/attendees/:id/edit", AttendeeLive.Index, :edit

    live "/attendees/:id", AttendeeLive.Show, :show
    live "/attendees/:id/show/edit", AttendeeLive.Show, :edit
  end
end
