require 'spec_helper'

describe "Kid" do

  let(:kid) { Kid.new }

  it "has a name" do
    kid.name = "Tyke"
    expect(kid.name).to eq("Tyke")
  end

  it "has an age" do
    kid.age = 14
    expect(kid.age).to eq(14)
  end

  it "has an feeling" do
    kid.feeling = "sick"
    expect(kid.feeling).to eq("sick")
  end

  it "has a bucket" do
    kid.save
    kid.bucket = Bucket.new
    kid.save
    expect(kid.bucket.id).to_not eq(nil)
  end

  describe "#pig_out" do
    before(:each) do
      @kid = Kid.create(:name => "Arel", :age => 14)
      @reeses = Candy.create(:name => "Reeses", :size => 2, :pieces => 2)
      @m_m = Candy.create(:name => "M&Ms", :size => 3, :pieces => 20)
      @skittles = Candy.create(:name => "Skittles", :size => 3, :pieces => 20)
      @milkyway = Candy.create(:name => "Milkyway", :size => 2, :pieces => 2)
      @redhots = Candy.create(:name => "Redhots", :size => 2, :pieces => 10)
      @bucket = Bucket.new
      @bucket.candies << [@m_m, @reeses, @skittles, @milkyway, @redhots]
      @kid.bucket = @bucket 
    end

    it "eats their candy" do
      @kid.pig_out(1)
      expect(@kid.feeling).to eq("Happy")
      expect(@kid.bucket.candies.count).to eq(4)
    end

    it "gets sick if they eat too much" do
      @kid.pig_out(4)
      found_kid = Kid.find_by(:name => "Arel")
      expect(found_kid.feeling).to eq("Sick")
      expect(found_kid.bucket.candies.count).to eq(1)
    end
  end
end
