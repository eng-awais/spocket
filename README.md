# SPOCKET-CO-TEST

#### Native Database Setup

1. Install and Start Postgres
   * `brew install postgresql && brew services start postgresql`
2. Make sure the `psql` command is available in CLI. If not, add the following: `export PATH=/usr/local/opt/postgresql@12/bin:$PATH` to your `.bash_profile` or `.zshrc` file
3. Postgres Setup:
  * `psql -c 'CREATE USER postgres SUPERUSER;' postgres`
4. Install and start Redis:
  * `brew install redis && brew services start redis`

#### Native Ruby Setup

1. Install Ruby using the version found in the `.ruby-version` file using a Ruby/language version manager. [rvm](https://rvm.io/) is recommended.
2. Install Gem dependencies:
   * `bundle`

#### Native Data Setup

 Postgres:
     `rails db:create`

#### Native Application Launch

`rails server`

## Testing

Create the test database (one time setup): `RAILS_ENV=test bundle exec rails db:create`. Then, unit tests can be run with Rspec: `bundle exec rspec`. Also note that the default Rake task will run both Rspec and Rubocop: `bundle exec rake`.

### Sidekiq/Background Jobs

* Start Sidekiq:
  * `sidekiq`
* View in web: `/sidekiq`
