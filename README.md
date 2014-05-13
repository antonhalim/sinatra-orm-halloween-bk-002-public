---
tags: orm, activerecord, sinatra, rspec
languages: ruby
  resources: 2
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

Your first job is to flesh out your object models. You'll be using Active Record to interact with the database.

Next you'll work on your Sinatra application, build routes, and erb
templates.

Start by forking the repository, running bundler, and running rspec. A
handful of specs have been implemented for you.

Some of the specs have notes on how to implement them, some do not. It
will be up to you to decide how your system works given a description of
the result. Have fun!

# Tasks

1. Work from the model specs first. Implement them one at a time.
2. Create migrations as needed. There are already a few boilerplate files in `db/migrate`.
3. Work on the non-bonus controller specs next.
4. Complete `db/seeds.rb` to populate your site with houses and candy!
5. Get the site working as described in the bonus specs, without
   actually filling in the test code.

Bonuses!

1. Implement the other bonus controller specs
2. Implement the routes and views that will allow you to add/edit houses
3. Implement a new, fun feature! My suggestion is that a given house can
   be haunted, and when you trick-or-treat there, a ghost freaks you out and you drop all your candy!

# Resources and Hints

Don't forget to run migrations after you make changes to your schema! (You'll get an error if you forget anyway.)

Look in `config/environment.rb` to see more of what's happening with the
environment.

Refer back to the Sinatra docs for session info when you need it.

You should not need sessions in your tests. Remember you can set up any
data you need in any test.

Don't forget to create methods to do work that you have to keep
repeating! Refactor as you go if you find yourself doing the same things
over and over.

## Resources
* [Sinatra Up and Running](http://books.flatironschool.com/books/101) - [Chapter 2 Fundamentals](http://books.flatironschool.com/books/101), page 29
* [Flatiron School Curriculum](https://github.com/flatiron-school-curriculum/) - [Blog on Sinatra](https://github.com/flatiron-school-curriculum/sinatra-blog)
