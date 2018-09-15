# Mark Six

A lotto Rails app, which can easily be deployed to Heroku.

# Getting started

Requires `ruby 2.5.1`, `rails 5.2.0`, `redis` and `postgresql` to run.

Use `brew` to get redis server and postgresql db running locally:

- `brew services start postgresql`
- `brew services start redis`


To get the Rails server running locally:

- Clone this repo
- `bundle install` to install all req'd dependencies
- `rake db:migrate` to make all database migrations
- `rails s` to start the local server
- `bundle exec sidekiq` to start the workers

Your app should now be running on [localhost:3000](http://localhost:3000/).

or

You can change `rails s` to `heroku local web`. Your app should now be running on [localhost:5000](http://localhost:5000/).

### Deploying to Heroku

```sh
$ brew install heroku
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```

# Code Overview

## Dependencies

- [Sidekiq](https://github.com/mperham/sidekiq) - For implementing background processing for `drawing` generation
- [Sidekiq Scheduler](https://github.com/moove-it/sidekiq-scheduler) - For implementing background processing scheduler
- [Devise](https://github.com/plataformatec/devise) - For implementing authentication
- [Jbuilder](https://github.com/rails/jbuilder) - Default JSON rendering gem that ships with Rails, used for making reusable templates for JSON output.


## Folders

- `app/models` - Contains the database models `User`, `Drawing`, `Ticket`, `Pick` and `WinningPick`.
- `app/views` - Contains templates for generating drawing listing and ticket transation.
- `app/controllers` - Contains the controllers `DrawingController` and `TicketController`
- `app/workers` - Contains the background `Sidekiq` workers for `Drawing` generation and `Drawing Open`.
- `config` - Contains configuration files for our Rails application and for our database, along with an `initializers` folder for scripts that get run on boot.
- `db` - Contains the migrations needed to create our database schema.

## Features

- Users can authenticate through `Mark Six` platform for tickets transaction
- The platform will generate a `Mark Six` drawing `every 1 minute` and the drawing will open in `1 minute` and finished. 
- Every drawing contains `10 numbers`. Users need to pick `6 numbers` every time. Users can buy `unlimited tickets` during drawing opening time. 
- Users can know the `drawing result`(winning numbers) and `if they are the winner` when drawing finished.

## Database Design

- `User` has many `Ticket`
- `Drawing` has many `Ticket`
- `Drawing` has many `WinningPick`
- `Ticket` has many `Pick`