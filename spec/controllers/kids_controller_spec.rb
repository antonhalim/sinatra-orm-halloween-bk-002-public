require 'spec_helper'

describe "KidsController" do

  describe "GET /kids" do 
    
  end
  describe "GET /kids/new" do 
  end

  describe "POST /kids" do 
  end

  describe "GET /kids/:id" do 
  end

  # BONUS:
  # The site should behave like this, but the bonus is implementing the specs
  it "keeps track of your bucket" do
    # GET '/bucket'
    # It should show the contents of your bucket
    
    # HINT: Set up kid and bucket data in this test and then 
    # go to the bucket id path, so that your test doesn't
    # have to be concerned with sessions. It looks something like this:
    # (this will depend on your model implementation)
    #
    # kid = Kid.new
    # kid.bucket = Bucket.new
    # house = House.new
    # house.trick_or_treat(kid)
    # get '/bucket/bucket.id'

    pending
  end

  it "lets you eat your candy" do
    # Create a route that you can link to that will show how much candy you ate
    # and the result (are you happy or sick?)
    
    pending
  end
end
