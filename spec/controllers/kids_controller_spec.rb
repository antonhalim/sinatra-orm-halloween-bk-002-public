require 'spec_helper'

describe "KidsController" do
  describe "GET /kids" do
    before do
      @mindy = Kid.create(:name => "Mindy Kaling", :age => 12)
      @mindy.bucket = Bucket.create
      @tina = Kid.create(:name => "Tina Fey", :age => 12)
      @tina.bucket = Bucket.create
      get "/kids"   
    end
    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end
    it "lists all the kids with links to their show pages" do
      expect(last_response.body).to include("<li><a href=\"kids/#{@mindy.id}\">#{@mindy.name}</a></li>")
      expect(last_response.body).to include("<li><a href=\"kids/#{@tina.id}\">#{@tina.name}</a></li>")
    end
  end
  describe "GET /kids/new" do 
    before do
      get "/kids/new"
    end
    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end
    it "should render a form for a new kid"
      expect(last_response.body).to include("<form action=\"kids\" method=\"post\"")
      expect(last_response.body).to include("</form>")
    end
  end
  describe "GET /kids/:id" do 
    before do 
      @sourpatch = Candy.create(:name => "Sour Patch Kids", :size => 3, :pieces => 15)
      @milkyway = Candy.create(:name => "Milkyway", :size => 2, :pieces => 2)
      @mindy = Kid.create(:name => "Mindy Kaling", :age => 12)
      @mindy.bucket = Bucket.create
      @mindy.bucket.candies << [@sourpatch, @milkyway]
      get "/kids/#{@mindy.id}"
    end
    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end
    it "should allow kid to pig out" do
      expect(last_response.body).to include("<form action=\"/kids/#{@mindy.id}/pig-out\" method=\"post\"")
    end
  end
  describe "POST /kids" do 
    before do
      post "/kids", {:'kid[name]' => "Tina Fey", :'kid[age]' => 9}
      @kid = Kid.find_by(:name => "Tina Fey")
      follow_redirect!  
    end
    it "redirects to the kids's show page" do
      expect(last_request.url).to eq("http://example.org/kids/#{@kid.id}")
    end
  end
  describe "POST /kids" do 
    before do
      post "/kids", {:'kid[name]' => "Tina Fey", :'kid[age]' => 9}
      @kid = Kid.find_by(:name => "Tina Fey")
      follow_redirect!  
    end
    it "redirects to the kids's show page" do
      expect(last_request.url).to eq("http://example.org/kids/#{@kid.id}")
    end
  end
  describe "POST /kids/:id/pig-out" do 
    before do
      # candies
      @sourpatch = Candy.create(:name => "Sour Patch Kids", :size => 3, :pieces => 15)
      @milkyway = Candy.create(:name => "Milkyway", :size => 2, :pieces => 2)
      @redhots = Candy.create(:name => "Redhots", :size => 3, :pieces => 20)
      @reeses = Candy.create(:name => "Reese", :size => 3, :pieces => 2)
      # kid and bucket
      @mindy = Kid.create(:name => "Mindy Kaling", :age => 12)
      @mindy.bucket = Bucket.create
      @mindy.bucket << [@sourpatch, @milkyway, @redhots, @reeses]
      post "/kids/{@mindy.id}/pig-out", {:consumption => 4}
      follow_redirect!  
    end
    it "redirects to the kids's show page" do
      expect(last_request.url).to eq("http://example.org/kids/#{@mindy.id}")
    end
    it "affects the candy displayed on the kids show page" do
      expect(last_request.url).to include("<h2>Candy Count: 0</h2>")
    end
    it "does not display eaten candy" do
      expect(last_request.url).to_not include(@sourpatch.name)
      expect(last_request.url).to_not include(@milkyway.name)
      expect(last_request.url).to_not include(@redhots.name)
      expect(last_request.url).to_not include(@reeses.name)
    end
  end
  # BONUS:
  # The site should behave like this, but the bonus is implementing the specs
  xit "keeps track of your bucket" do
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

  xit "lets you eat your candy" do
    # Create a route that you can link to that will show how much candy you ate
    # and the result (are you happy or sick?)
    
    pending
  end
end
