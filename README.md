# trine - API

The trine API handles persistence of resources required to view, add, and manage routines and tasks.

## Source

Hosted at https://github.com/n-larsson/trine

## Install

Below instructions are for Mac OS X:

    curl -sSL https://get.rvm.io | bash
    rvm install ruby-2.2.1
    brew install postgres
    initdb /usr/local/var/postgres -E utf8
    postgres -D /usr/local/var/postgres
    bundle install
    rake db:migrate
    rake db:setup
    rake

## Test

    rake

## Develop

    rails server
    open http://localhost:3000

## Deployment

  Download Heroku Toolbelt from https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up
  heroku login
  heroku git:remote -a safe-eyrie-9009
  git push heroku

### Staging server:

https://safe-eyrie-9009.herokuapp.com/

## Documentation

See http://docs.trine.apiary.io/#

## License

Private, proprietary
