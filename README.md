---
tags: ORM, Sequel, sinatra, rspec
languages: ruby
---

# Halloween Candy!

This year you're giving out virtual candy, which doesn't taste great,
but it also keeps kids lean and fit so they can outrun the rising tides
from global warming.

You're creating a web application that will show all the houses in a
neighborhood, and allow a kid (visitor) to trick-or-treat at a house and
get candy in their bucket.

This will be challenging! There's a lot to do here. You will need to
implement your own specs, do migrations, create models, and build the
Sinatra app for the domain model from scratch.

Take your time, work through it step by step, and don't worry if you
don't get it all done in one night! Progress is better than no progress!

Your first job is to flesh out your object models. You'll be using the
Sequel gem to interact with the database.

Next you'll work on your Sinatra application, build routes, and erb
templates.

Start by forking the repository, running bundler, and running rspec. A
handful of specs and migrations have been implemented for you.

Some of the specs have notes on how to implement them, some do not. It
will be up to you to decide how your system works given a description of
the result. Have fun!

# Tasks

1. Work from the model specs first. Implement them one at a time.
2. Create migrations as needed. There are already examples in
   db/migrations. Add yours there.
3. Work on the non-bonus route specs next.
4. Edit config.ru and get your site running
5. Complete `db/seed.rb` to populate your site with houses and candy!
6. Get the site working as described in the bonus specs, without
   actually filling in the test code.

Bonuses!

1. Implement the other bonus route specs
2. Implement the routes and views that will allow you to add/edit houses
3. Implement a new, fun feature! My suggestion is that a given house can
   be haunted, and when you trick-or-treat there, a ghost freaks you out
and you drop all your candy!
4. Write some code in your spec_helper that will reset your database to
   a clean state for each test!

# Resources and Hints

Don't forget to run migrations after you make changes to your schema!

I've created a script for you in the `db/` folder called `migrate.rb`.
This script will help you run your migrations.

To use it, call it from
the command-line at the root of the project directory with an argument
for the environment.

remember: the test db and the development db will be different!

Ex: `ruby db/migrate.rb test`

Look in `config/environment.rb` to see more of what's happening with the
environment

[Avi's TODO for Sequel](https://github.com/flatiron-school/sequel-orms-ruby-003)
[Sequel Gem Documentation](https://github.com/jeremyevans/sequel)

Refer back to the Sinatra docs for session info when you need it.

You should not need sessions in your tests. Remember you can set up any
data you need in any test.

Don't forget to create methods to do work that you have to keep
repeating! Refactor as you go if you find yourself doing the same things
over and over.
