require 'spec_helper'

describe "House" do
  before do
    @cottage = House.create(:address=>"132 Seabridge Ln")
    @skittles = Candy.create(:name => "Skittles", :size => 3, :pieces => 20)
    @milkyway = Candy.create(:name => "Milkyway", :size => 2, :pieces => 2)
    @redhots = Candy.create(:name => "Redhots", :size => 2, :pieces => 10)
    @kid = Kid.create(:name => "Arel", :age => 14)
    @kid.bucket = Bucket.new
    @cottage.candies << [@skittles, @milkyway, @redhots]
  end

  it "has an address" do
    expect(@cottage.address).to eq("132 Seabridge Ln")
  end

  it "knows what candy hasn't been distributed yet (candies where bucket_id is nil)" do
    expect(@cottage.unclaimed_candies.count).to eq(3)

    @cottage.candies.first.update(:bucket_id => 1)
    
    found_cottage = House.find_by(:address => "132 Seabridge Ln")
    expect(found_cottage.unclaimed_candies.count).to eq(2)
  end

  it "puts the first unclaimed candy into a kid's bucket" do
    expect(@kid.bucket.candies.count).to eq(0)
    expect(@cottage.candies[0].bucket_id).to eq(nil)
    @cottage.give_candy(@kid)
    found_kid = Kid.find_by(:name => "Arel")
    found_cottage = House.find_by(:address => "132 Seabridge Ln")
    expect(found_kid.bucket.candies.count).to eq(1)
    expect(found_cottage.candies[0].bucket_id).to eq(@kid.bucket.id)
  end

  it "knows if a kid is too old to trick-or-treat" do
    avi = Kid.create(:name => "Avi", :age => 30)
    avi.bucket = Bucket.new
    expect(@cottage.give_candy(avi)).to eq("You're too old to trick-or-treat.")
    expect(avi.bucket.candies.count).to eq(0)
    expect(@cottage.candies[0].bucket_id).to eq(nil)
  end

  it "can give candy to a kid" do
    expect(@kid.bucket.candies.count).to eq(0)
    @cottage.give_candy(@kid)
    found_kid = Kid.find_by(:name => "Arel")
    expect(found_kid.bucket.candies.count).to eq(1)
    expect(found_kid.bucket.candies).to include(@skittles || @milkyway || @redhots)
  end

end
