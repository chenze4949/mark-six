# Mark Six

A lotto Rails app, which can easily be deployed to Heroku.

### Installation

Lotto requires `ruby 2.5.1`, `rails 5.2.0`, `redis` and `postgresql` to run.

For development environments, install the dependencies and devDependencies and start the server.

```sh
$ brew services start postgresql
$ brew services start redis
$ bundle
$ rails db:migrate
$ rails server
$ bundle exec sidekiq
```

Your app should now be running on [localhost:3000](http://localhost:3000/).

or

You can change `rails server` to `heroku local web`. Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```sh
$ brew install heroku
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```
