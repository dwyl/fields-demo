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
  end
end
