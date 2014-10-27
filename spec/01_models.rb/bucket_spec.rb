require 'spec_helper'

describe "Bucket" do
  before do 
    @skittles = Candy.create(:name => "Skittles", :size => 3, :pieces => 20)
    @milkyway = Candy.create(:name => "Milkyway", :size => 2, :pieces => 2)
    @redhots = Candy.create(:name => "Redhots", :size => 2, :pieces => 10)
    @kid = Kid.create(:name => "Arel", :age => 14)
    @kid.bucket = Bucket.new
    @kid.bucket.candies << [@skittles, @milkyway, @redhots]
    @pail = @kid.bucket
  end
  it "belongs to a kid" do
    expect(@pail.kid_id).to eq(@kid.id)
  end

  it "can contain candy" do
    expect(@pail.candies.map {|c| c.name}).to include("Milkyway")
  end

  it "has a count of its candy" do
    expect(@pail.candies.count).to eq(3)
  end
end
