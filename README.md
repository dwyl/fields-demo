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


### 2. Setup Coverage

So we know which files are covered by tests,
we setup coverage following the steps outlined in:
[/dwyl/phoenix-chat-example#13-what-is-not-tested](https://github.com/dwyl/phoenix-chat-example#13-what-is-not-tested)

> **Note**: This is the _first_ thing 
> we add to all new `Elixir/Phoenix` projects
because it lets us see what is _not_ being tested. 🙈
It's just a good engineering discipline/habit to get done; a 
[hygiene factor](https://en.wikipedia.org/wiki/Two-factor_theory)
like brushing your teeth. 🪥

With that setup we can now run:

```sh
mix c
```

We see output similar to the following:

```sh
.....
Finished in 0.07 seconds (0.03s async, 0.04s sync)
5 tests, 0 failures

Randomized with seed 679880
----------------
COV    FILE                                        LINES RELEVANT   MISSED
  0.0% lib/fields_demo.ex                              9        0        0
 75.0% lib/fields_demo/application.ex                 36        4        1
  0.0% lib/fields_demo/repo.ex                         5        0        0
100.0% lib/fields_demo_web.ex                        111        2        0
 15.9% lib/fields_demo_web/components/core_comp      661      151      127
  0.0% lib/fields_demo_web/components/layouts.e        5        0        0
100.0% lib/fields_demo_web/controllers/error_ht       19        1        0
100.0% lib/fields_demo_web/controllers/error_js       15        1        0
100.0% lib/fields_demo_web/controllers/page_con        9        1        0
  0.0% lib/fields_demo_web/controllers/page_htm        5        0        0
  0.0% lib/fields_demo_web/endpoint.ex                47        0        0
 66.7% lib/fields_demo_web/router.ex                  27        3        1
 80.0% lib/fields_demo_web/telemetry.ex               92        5        1
100.0% test/support/conn_case.ex                      38        2        0
 28.6% test/support/data_case.ex                      58        7        5
[TOTAL]  23.7%
----------------
```

Not great. 
But most of the untested code is in:
`lib/fields_demo_web/components/core_components.ex`
which we aren't going to _use_ in this project ...

#### 2.1 Ignore Unused "System" Files

Create a file with called `coveralls.json`
and add the following contents:

```json
{
  "coverage_options": {
    "minimum_coverage": 100
  },
  "skip_files": [
    "lib/fields_demo/application.ex",
    "lib/fields_demo_web/components/core_components.ex",
    "lib/fields_demo_web/telemetry.ex",
    "test/"
  ]
}
```
Save the file.
This sets **`100%`** coverage as our minimum/baseline
and ignores the files we aren't reaching with our tests.

Re-run:

```sh
mix c
```

And you should see the following output:

```sh
.....
Finished in 0.05 seconds (0.01s async, 0.04s sync)
5 tests, 0 failures

Randomized with seed 253715
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/fields_demo.ex                              9        0        0
100.0% lib/fields_demo/repo.ex                         5        0        0
100.0% lib/fields_demo_web.ex                        111        2        0
100.0% lib/fields_demo_web/components/layouts.e        5        0        0
100.0% lib/fields_demo_web/controllers/error_ht       19        1        0
100.0% lib/fields_demo_web/controllers/error_js       15        1        0
100.0% lib/fields_demo_web/controllers/page_con        9        1        0
100.0% lib/fields_demo_web/controllers/page_htm        5        0        0
100.0% lib/fields_demo_web/endpoint.ex                47        0        0
100.0% lib/fields_demo_web/router.ex                  23        2        0
[TOTAL] 100.0%
----------------
```

Now we can move on!

## 3. Run the Phoenix App!

Before we start adding features,
let's run the default `Phoenix` App.
In your terminal, run:

```sh
mix setup
mix phx.server
```

> **Note**: we always create an alias for `mix phx.server` as `mix s`.

With the `Phoenix` server running,
visit 
[localhost:4000](http://localhost:4000)
in your web browser,
you should see something similar to the following:

<img width="796" alt="image" src="https://github.com/dwyl/fields/assets/194400/891e890e-c94a-402e-baee-ee47fd3725a7">

That completes 2 minutes of "setup".
Let's add a schema!

# FieldsDemo

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

