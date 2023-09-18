<div align="center">

# `fields` _demo_

Quick demo of the `fields` package.

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/dwyl/fields-demo/ci.yml?label=build&style=flat-square&branch=main)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/fields-demo/main.svg?style=flat-square)](https://codecov.io/github/dwyl/fields-demo?branch=main)
[![Hex.pm](https://img.shields.io/hexpm/v/fields?color=brightgreen&style=flat-square)](https://hex.pm/packages/fields)
[![docs](https://img.shields.io/badge/docs-amaze-brightgreen?style=flat-square)](https://hexdocs.pm/fields/api-reference.html)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/fields/issues)
[![HitCount](https://hits.dwyl.com/dwyl/fields-demo.svg)](https://hits.dwyl.com/dwyl/fields-demo)

</div>

## Why?

To showcase `fields` in a basic Phoenix App a complete beginner can understand in 5 minutes.

## What?

A _tiny_ demo/example app using `fields` to store an "event participant registration form"
that uses as many of the `fields` as possible in real-world ways. 

## Who?

This is aimed at people getting started with `fields`,
both `@dwyl` and the wider `Elixir` community.

# How?



## Build Log

This is a comprehensive step-by-step log 
of everything we did when creating this demo app.
If you feel we have skipped a step
or anything is unclear,
please 
[open an issue](https://github.com/dwyl/fields-demo/issues)


### 1. Create a New Phoenix App

Create a New Phoenix App:

```sh
mix phx.new fields_demo --no-mailer --no-dashboard --no-gettext
```

> **Note**: We don't need to send email, have a fancy dashboard or translation. 

# FieldsDemo

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

