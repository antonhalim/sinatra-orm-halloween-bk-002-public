require_relative '../spec_helper.rb'

describe "root controller" do
  it "welcomes you to halloween, the greatest holiday"

  it "asks for your name and age and makes you a kid with a bucket" do
    pending #post /start
    # you'll need to use a form, post to a route
    # and use sessions here to keep track of the visitor
    # and their bucket
  end

  # BONUS:
  # The site should behave like this, but the bonus is implementing the specs
  it "keeps track of your bucket" do
    pending # get '/bucket'
    # it should show the contents of your bucket
    # hint: set up kid and bucket data in this test and then 
    # go to the bucket id path, so that your test doesn't
    # have to be concerned with session. It looks something like this:
    # (this will depend on your model implementation)
    #
    # kid = Kid.new
    # kid.bucket = Bucket.new
    # house = House.new
    # house.trick_or_treat(kid)
    # get /bucket/bucket.id
  end

  it "lets you eat your candy" do
    pending
    # create a route that you can link to that will show how much candy you ate
    # and the result (are you happy or sick?)
  end
end
