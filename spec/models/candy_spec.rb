require 'spec_helper'

describe "Candy" do
  before do 
    @skittles = Candy.create(:name => "Skittles", :size => 3, :pieces => 20)

    @modest_house = House.new(:address => "2342 Brooks St.")
    @modest_house.candies << @skittles

    @andy = Kid.create(:name => "Andy Sanberg", :age => 6)
    @andy.bucket = Bucket.new
    @andy.bucket.candies << @skittles
    @pail = @andy.bucket
  end
  it "has a name" do
    expect(@skittles.name).to eq("Skittles")
  end

  it "has a number of pieces per package" do
    expect(@skittles.pieces).to eq(20)
  end

  it "has a size" do
    expect(@skittles.size).to eq(3)
  end

  it "belongs to a house" do
    expect(@skittles.house).to eq(@modest_house)
  end

  it "belongs to a bucket" do
    expect(@skittles.bucket).to eq(@pail)
  end

  it "belongs to a kid through a bucket" do
    expect(@skittles.bucket.kid).to eq(@andy)
  end
end
