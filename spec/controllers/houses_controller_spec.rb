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
      @cottage.candies << [@redhots, @twix, @mints, @sourpatch] 
      @mansion.candies << [@skittles, @milkyway]
      get '/houses'
    end
    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end
    it "renders the houses index template with candies" do
      expect(last_response.body).to include("<h1>All Houses</h1>")
      expect(last_response.body).to include("123 S. Seaside Ln.")
      expect(last_response.body).to include("1019 Expensive Ave.")
      expect(last_response.body).to include(@twix.name)
      expect(last_response.body).to include(@skittles.name)
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
  end

  xit "allows you to trick-or-treat the house" do
    pending
  end

  # BONUS: Implement the forms required to do the following:
  xit "allows you to add a house" do
    pending
  end

  xit "allows you to edit a house" do
    pending
  end
end
