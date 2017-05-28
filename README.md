# Hanami Bookshelf

An implementation of the hanami getting started guide.

## Basic instructions

To start the site.

~~~ bash
foreman start --procfile Procfile.development
~~~

To access the site point you browser to http://localhost:2300

## Differences from guide

* Project created to use postgresql
* Test implemented using rspec

## Setup

### Database

~~~ bash
brew install postgresql
~~~

~~~ bash
pg_ctl init -D vendor/postgresql
~~~

~~~ bash
psql -p 5432 -h localhost -d postgres
~~~

~~~ sql
CREATE USER postgres SUPERUSER;
~~~

Development database

~~~ bash
bundle exec hanami db prepare
~~~

Test database

~~~ bash
HANAMI_ENV=test bundle exec hanami db prepare
~~~

## References

* [Hanami - Getting started guide](http://hanamirb.org/guides/getting-started/)