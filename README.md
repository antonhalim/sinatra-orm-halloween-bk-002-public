---
tags: activerecord, sinatra, associations, mvc
languages: ruby
resources: 2
---

# Trick-Or-Treating App

This year you're giving out virtual candy, which doesn't taste great, but it also keeps kids lean and fit so they can outrun the rising tides from global warming.

You're creating a web application that will show all the houses in a neighborhood, and allow a kid to trick-or-treat at a house and get candy in their bucket.

This will be challenging! There's a lot to do here. Think carefully about the model associations. You will need to create migrations, create models, and build the Sinatra app for the domain model from scratch. Then you will need to build out the routes and views.

## Models

There will be four models:
* house
* kid
* bucket
* candy

The kids each have one bucket, buckets have a lot of candy. Houses also have a lot of candy.

# Tasks

1. Before getting started, run `bundle install`.
2. The specs are written order of ascending difficulty so start with the first ones.
3. Create migrations and model assoications first, then run `rake db:migrate SINATRA_ENV=test`
4. For a console to play around with your models and associations, run `rake console`.
5. Always look at your `db/schema.rb` file to see if your migrations were successful. If they weren't, instead of editing the schema file, edit the migration file, delete the schema file, your database(s) (`db/halloween_test.sqlite` and `db/halloween_development.sqlite`) before re-running the rake migration task.
6. Once your models specs are passing, run `rake db:migrate` followed by `rake db:seed`.
7. Work on the instance method tests after your models and migrations are solid.
8. Work on the controller specs after passing the instance method tests.
  * If you'd like to see what the pages look like that your controller is rendering, place `save_and_open_page` in your spec. This tells the `launchy` gem to save the HTML and open it in your browser.
9. If you want to see what your app is like, run `shotgun`, then visit [localhost:9393](http://localhost:9393).

## Patch Example

Here's an example of a form using PATCH to update a dog (`@dog`).

```html
<!-- http://localhost:9292/dogs/7/edit -->

<form action="/dogs/<%= @dog.id %>" method="POST">
  <input name="_method" type="hidden" value="patch" />

  <label>Name</label>:
  <input name="dog[name]" type="text" value="<%= @dog.name %>" /><br />

  <label>Age</label>:
  <input id="person_last_name" name="dog[age]" type="number" value="<%= @dog.age %>" /><br />

  <button type="submit">"Update Dog"</button>
</form>

```

Here's an example of a controller accepting the PATCH from the form above:

```ruby
class DogsController < ActionController

  patch "/dogs/:id" do 
    @dog = Dog.find(params[:id])
    if @dog.update(params[:dog])
      redirect "/dogs/#{@dog.id}"
    else
      redirect "/dogs/#{@dog.id}/edit"
    end
  end

end

```

## Resources
* [Sinatra Up and Running](http://books.flatironschool.com/books/101) - [Chapter 2 Fundamentals](http://books.flatironschool.com/books/101), page 29
* [Flatiron School Curriculum](https://github.com/flatiron-school-curriculum/) - [Blog on Sinatra](https://github.com/flatiron-school-curriculum/sinatra-blog)
