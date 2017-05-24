# Hanami Bookshelf

~~~ bash
foreman start --procfile Procfile.development
~~~

Point browser to http://localhost:2300

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
