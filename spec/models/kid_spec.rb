require_relative '../spec_helper.rb'

describe "Kid" do
  it "has a bucket"
  it "has a collection route"
  it "has a list of houses on the collection route"
  it "has a name"
  it "has an age"
  describe ".trick_or_treat" do
    it "trick-or-treats the next house on the route"
    it "TPs the house if it doesn't get a treat"
    it "Goes home if the route is over"
  end
  describe ".pig_out" do
    it "eats its candy"
    it "gets sick if it eats too much"
  end
end
