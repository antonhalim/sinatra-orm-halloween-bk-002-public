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
      expect(last_response.body).to include("<li><a href=\"/kids/#{@mindy.id}\">#{@mindy.name}</a></li>")
      expect(last_response.body).to include("<li><a href=\"/kids/#{@tina.id}\">#{@tina.name}</a></li>")
    end
  end
  describe "GET /kids/new" do 
    before do
      get "/kids/new"
    end
    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end
    it "should render a form for a new kid" do
      expect(last_response.body).to include("<form action=\"/kids\" method=\"POST\"")
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
      expect(last_response.body).to include("<form action=\"/kids/#{@mindy.id}/pig-out\" method=\"POST\"")
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
      @mindy.bucket.candies << [@sourpatch, @milkyway, @redhots, @reeses]
      post "/kids/#{@mindy.id}/pig-out", {:consumption => 4}
      follow_redirect!  
    end
    it "redirects to the kids's show page" do
      expect(last_request.url).to eq("http://example.org/kids/#{@mindy.id}")
    end
    it "affects the candy displayed on the kids show page" do
      expect(last_request.body).to include("<h3>Candy Count: 0</h3>")
    end
    it "does not display eaten candy" do
      expect(last_request.url).to_not include(@sourpatch.name)
      expect(last_request.url).to_not include(@milkyway.name)
      expect(last_request.url).to_not include(@redhots.name)
      expect(last_request.url).to_not include(@reeses.name)
    end

    xit "displays mood based on candy consumption" do 
    end
  end
end
