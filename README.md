# Jungle

A mini e-commerce application built with Rails 4.2.6 for purposes of teaching Rails by example.

Mainpage
!["Main Page"](https://github.com/willianchu/jungle-rails/blob/master/docs/mainpage.jpg)

Checkout
!["Checkout"](https://github.com/willianchu/jungle-rails/blob/master/docs/checkout.jpg)

Order  Stripe
!["Stripes"](https://github.com/willianchu/jungle-rails/blob/master/docs/checkoutstripe.jpg)

Secret Area (only with the Admin credencials)
!["Stripes"](https://github.com/willianchu/jungle-rails/blob/master/docs/secretarea.jpg)

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

Jungle has actually several dependencies of open source projects to work properly.
Instructions on how to use them in your own application are linked below.

| Dependecies | README |
| ------ | ------ |
| Ruby 2.3.5| [https://www.ruby-lang.org/en/downloads/] |
| Rails 4.2.6| [https://rubygems.org/gems/rails] |
| pg | [https://rubygems.org/gems/pg] |
| PostgreSQL 9 | [https://www.postgresql.org/] |
| puma | [https://rubygems.org/gems/puma/] |


Scheduler is open source itself too! with a [https://github.com/willianchu/jungle-rails][willianchu]
 on GitHub.
