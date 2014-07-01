require 'spec_helper'

describe "HousesController" do
  describe "GET /houses" do
    before do
      House.create(address: "123 S. Seaside Ln.")
      House.create(address: "1019 Expensive Ave.")
      get '/houses'
    end
    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end
    it "renders the houses index template" do
      expect(last_response.body).to include("<h1>All Houses</h1>")
      expect(last_response.body).to include("123 S. Seaside Ln.")
      expect(last_response.body).to include("1019 Expensive Ave.")
    end
  end

  describe "GET /houses/:id" do
    before do
      cottage = House.create(address: "123 S. Seaside Ln.")
      get "/houses/#{cottage.id}"
    end
    it "allows you to see a house" do
      expect(last_response).to be_ok
    end
    it "renders the house show template" do
      expect(last_response.body).to include("123 S. Seaside Ln.")
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
