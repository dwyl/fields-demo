<div align="center">

# `fields` _demo_

Quick demo of the [**`fields`**](https://github.com/dwyl/fields) package to **build `Phoenix` Apps _much_ faster**.

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/dwyl/fields-demo/ci.yml?label=build&style=flat-square&branch=main)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/fields-demo/main.svg?style=flat-square)](https://codecov.io/github/dwyl/fields-demo?branch=main)
[![Hex.pm](https://img.shields.io/hexpm/v/fields?color=brightgreen&style=flat-square)](https://hex.pm/packages/fields)
[![docs](https://img.shields.io/badge/docs-amaze-brightgreen?style=flat-square)](https://hexdocs.pm/fields/api-reference.html)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/fields/issues)
[![HitCount](https://hits.dwyl.com/dwyl/fields-demo.svg)](https://hits.dwyl.com/dwyl/fields-demo)

</div>

Jump to the section that interests you:

- [`fields` _demo_](#fields-demo)
  - [Why?](#why)
  - [What?](#what)
  - [Who?](#who)
- [How?](#how)
  - [1. Clone from `GitHub`](#1-clone-from-github)
  - [2. Setup Dependencies \& Database](#2-setup-dependencies--database)
  - [3. Run the App](#3-run-the-app)
- [TODO: add GIF of inputting data.](#todo-add-gif-of-inputting-data)
- [Build Log?](#build-log)
- [Register for _Awesome_ Conf!](#register-for-awesome-conf)
- [FieldsDemo](#fieldsdemo)



## Why?

To showcase `fields` in a basic Phoenix App a complete beginner can understand in 5 minutes.

## What?

A _tiny_ demo/example app using `fields` to store an "event participant registration form"
that uses as many of the `fields` as possible in real-world ways. 

## Who?

This is aimed at people getting started with `fields`,
both `@dwyl` and the wider `Elixir` community.

# How?

Run the demo on your computer!

## 1. Clone from `GitHub`

Clone the project from `GitHub`:

```sh
git clone git@github.com:dwyl/fields-demo.git
```

## 2. Setup Dependencies & Database

Setup the project on `localhost`:

```sh
mix setup
```

## 3. Run the App

Run the app:

```sh
mix s
```

Open the app in your browser,
you should expect to see:

# TODO: add GIF of inputting data.


# Build Log?

We wrote a comprehensive step-by-step log 
of everything we did 
when creating the `fields-demo` app:


If you feel we have skipped a step
or anything is unclear,
please 
[open an issue](https://github.com/dwyl/fields-demo/issues)


<div align="center">

# Register for _Awesome_ Conf! 

<img width="286" alt="awesome smiley" src="https://github.com/dwyl/content/assets/194400/dc803ac9-97e9-4088-9c3d-819d0de42aec">

</div>


# 4. Create `attendee` schema

The goal is to allow `people` attending **_Awesome_ Conf**
to submit the following data:

+ `first_name` - how we greet you. Will appear on your conference pass.
+ `last_name` - your family name. Will appear on you conference pass.
+ `email` - to confirm attendance
+ `phone_number`  - to verify your access when attending the secret event.
+ `address` - so we can send the welcome pack
+ `address_line_2` - if your address has multiple lines.
+ `postcode` - for the address.
+ `gender` - for venue capacity planning.
+ `dietary_preference` - for meals and snacks provided by the conference.
+ `website` - share your awesomeness and have it as a QR code on your conference pass.
+ `description` - brief description of your awesome project.
+ `feedback` - Feedback or suggestions


## 4.1 `gen.schema`

Using the 
[`mix phx.gen.live`](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Schema.html)
command, 
run: 
```sh
mix phx.gen.live Accounts Attendee attendees first_name:string last_name:string email:string --no-context
```

You should expect to see output similar to the following:

```sh
* creating lib/fields_demo_web/live/attendee_live/show.ex
* creating lib/fields_demo_web/live/attendee_live/index.ex
* creating lib/fields_demo_web/live/attendee_live/form_component.ex
* creating lib/fields_demo_web/live/attendee_live/index.html.heex
* creating lib/fields_demo_web/live/attendee_live/show.html.heex
* creating test/fields_demo_web/live/attendee_live_test.exs

Add the live routes to your browser scope in lib/fields_demo_web/router.ex:

    live "/attendees", AttendeeLive.Index, :index
    live "/attendees/new", AttendeeLive.Index, :new
    live "/attendees/:id/edit", AttendeeLive.Index, :edit

    live "/attendees/:id", AttendeeLive.Show, :show
    live "/attendees/:id/show/edit", AttendeeLive.Show, :edit
```


# FieldsDemo

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

