# README
# Rails Engine README

## Contributors
* [Dan Broadbent](https://github.com/danbroadbent)
* [Susi Irwin](https://github.com/susiirwin)

## About
Rails (or Rales) Engine is a project where we have built an API which allows a user to run Business Intelligence Analytics against the database. Our database is Postgresql and it stores:

* merchants
* transactions
* customers
* invoices
* items
* invoice items

There are endpoints designed to allow you to send a request and return different sets of data.

```
/api/v1/merchants
```
and it will return all of the merchants in the database using JSON:

``` json
[
  {
    "id":1,
    "name":"Schroeder-Jerde"
  },
  {
    "id":2,
    "name":"Klein, Rempel and Jones"
  },
  {
    "id":3,
    "name":"Willms and Sons"
  }
]
```

You can get deeper Business Intelligence (BI) by reaching an endpoint such as the total revenue for a given Merchant:

```
GET /api/v1/merchants/:id/revenue
```
or the revenue of that Merchant on a specific date:

```
GET /api/v1/merchants/:id/revenue?date=x
```

## Set Up Rails Engine

In your terminal, copy and clone the following:
```
git clone https://github.com/susiirwin/rails_engine
```
CD into your directory and run bundle:
```
bundle
```
You will need to setup the database following this command in your terminal:
```
rails db:setup
```
There is a single rake task used to seed your database (this may take a few minutes to run).
```
rake import
```
Run the test suite using Rspec.
```
rspec
```
You can also run the [spec harness](https://github.com/turingschool/rales_engine_spec_harness) provided by [Turing School](https://github.com/turingschool) by switching into the spec harness directory from the project root directory
```
cd rales_engine_spec_harness
```
Then run in your terminal:
```
rake
```
