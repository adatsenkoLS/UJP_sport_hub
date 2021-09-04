# Intallation of dev environment

## 1. Install dependencies

- install RVM (http://rvm.io/)
  - `gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`
  - `\curl -sSL https://get.rvm.io | bash -s stable`
  - `\curl -sSL https://get.rvm.io | bash -s stable --rails`
  - add `--login` option to you terminal command
- install ruby
  - `rvm install ruby-3.0.0`
- install Postgresql
  - `sudo apt-get install postgresql-13 libpq-dev`
- install nodejs
  - `sudo apt-get install nodejs npm`
- install yarn
  - `sudo npm install --global yarn`

## 2. Create database user

  - `sudo -u postgres psql` for Linux or `psql postgres` for Mac
  - `create role sporthub with password 'password' LOGIN CREATEDB;`
  - `\q`

## 3. Install gems

  - `gem install bundler`
  - `bundle install`

## 4. Initialize database

  - `rake db:create`

## 5. Install npm dependencies
  
  - `yarn install`

## 6. Startup rails
  
  - `rails server`
