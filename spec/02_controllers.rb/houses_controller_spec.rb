require 'spec_helper'

describe "HousesController" do
  describe "GET /houses" do
    before do
      @cottage = House.create(address: "123 S. Seaside Ln.")
      @mansion = House.create(address: "1019 Expensive Ave.")
      @skittles = Candy.create(:name => "Skittles", :size => 3, :pieces => 20)
      @milkyway = Candy.create(:name => "Milkyway", :size => 2, :pieces => 2)
      @redhots = Candy.create(:name => "Redhots", :size => 2, :pieces => 10)
      @twix = Candy.create(:name => "Twix", :size => 2, :pieces => 2)
      @mints = Candy.create(:name => "Junior Mints", :size => 4, :pieces => 20)
      @sourpatch = Candy.create(:name => "Sour Patch Kids", :size => 3, :pieces => 15)
      @mindy = Kid.create(:name => "Mindy Kaling", :age => 12)
      @mindy.bucket = Bucket.create
      @mindy.bucket.candies << @sourpatch
      @cottage.candies << [@redhots, @twix, @mints, @sourpatch] 
      @mansion.candies << [@skittles, @milkyway]
      get '/houses'
    end
    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end
    it "renders the houses index template with houses" do
      expect(last_response.body).to include("<h1>All Houses</h1>")
      expect(last_response.body).to include("123 S. Seaside Ln.")
      expect(last_response.body).to include("1019 Expensive Ave.")
    end
    it "displays the unclaimed candy for each houses" do
      expect(last_response.body).to include("<h1>All Houses</h1>")
      expect(last_response.body).to include("123 S. Seaside Ln.")
      expect(last_response.body).to include("1019 Expensive Ave.")
      expect(last_response.body).to include(@twix.name)
      expect(last_response.body).to include(@skittles.name)
      expect(last_response.body).to_not include(@sourpatch.name)
    end
    it "does not display claimed candy" do
      expect(last_response.body).to_not include(@sourpatch.name)
    end
  end

  describe "GET /houses/:id" do
    before do
      @cottage = House.create(address: "123 S. Seaside Ln.")
      @redhots = Candy.create(:name => "Redhots", :size => 2, :pieces => 10)
      @twix = Candy.create(:name => "Twix", :size => 2, :pieces => 2)
      @mints = Candy.create(:name => "Junior Mints", :size => 4, :pieces => 20)
      @sourpatch = Candy.create(:name => "Sour Patch Kids", :size => 3, :pieces => 15)
      @cottage.candies << [@redhots, @twix, @mints, @sourpatch]
      @kid = Kid.create(:name => "Tina Fey", :age => 12)
      get "/houses/#{@cottage.id}"
    end
    it "allows you to see a house" do
      expect(last_response).to be_ok
    end
    it "renders the house show template" do
      expect(last_response.body).to include("123 S. Seaside Ln.")
      expect(last_response.body).to include(@sourpatch.name)
      expect(last_response.body).to include(@redhots.name)
    end

    it "displays a form that allows kids to trick-or-treat the house" do
      expect(last_response.body).to include("<form action=\"/houses/#{@cottage.id}/trick-or-treat\"")
      expect(last_response.body).to include("Tina Fey")
    end
  end


  describe "create a new house" do

    describe "new form" do
      it "responds with a 200 status code" do
        get "/houses/new"
        expect(last_response).to be_ok
      end
      it "should render a form for a new house" do
        get "/houses/new"
        expect(last_response.body).to include("<form action=\"/houses\" method=\"POST\"")
        expect(last_response.body).to include("</form>")
      end
    end

    describe "form post" do
      before do
        post "/houses", {:'house[address]' => "11 Broadway"}
        
        follow_redirect!  
        @house = House.find_by(:address => "11 Broadway")
      end
      it "redirects to the houses's show page" do
        expect(last_request.url).to eq("http://example.org/houses/#{@house.id}")
      end
    end
  end


  describe "POST /houses/:id/trick-or-treat" do
    before do
      @cottage = House.create(address: "123 S. Seaside Ln.")
      @redhots = Candy.create(:name => "Redhots", :size => 2, :pieces => 10)
      @cottage.candies << @redhots
      @tina = Kid.create(:name => "Tina Fey", :age => 12)
      @tina.bucket = Bucket.create
      post "/houses/#{@cottage.id}/trick-or-treat", {:kid_id => @tina.id}
      follow_redirect!
    end
    it "redirects to the house's show page" do
      expect(last_request.url).to eq("http://example.org/houses/#{@cottage.id}")
    end
    it "removes a candy from the house's show page after it was given to a kid" do
      expect(last_response.body).to_not include(@redhots.name)
    end
    it "assigns a kid to the candy that was distributed" do
      expect(@tina.bucket.candies.count).to eq(1)
      expect(@tina.bucket.candies).to include(@redhots)
    end
  end

  describe "PATCH /houses/:id" do
    before do
      @cottage = House.create(address: "321 N. Seaslide Nl.")
      post "/houses/#{@cottage.id}", {:house => {:address => "123 S. Seaside Ln."}}
      follow_redirect!
    end
    it "redirects to an updated house show page" do
      expect(last_request.url).to eq("http://example.org/houses/#{@cottage.id}")
      expect(last_response.body).to include("123 S. Seaside Ln.")
    end
  end
end
