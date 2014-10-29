require 'spec_helper'

describe "Kid" do

  let(:candy_array) {
   [
      {:name => "Reeses", :size => 2, :pieces => 2},
      {:name => "M&Ms", :size => 3, :pieces => 20},
      {:name => "Milkyway", :size => 1, :pieces => 3},
      {:name => "Redhots", :size => 2, :pieces => 10},
      {:name => "M&Ms", :size => 3, :pieces => 20},
      {:name => "Take5", :size => 1, :pieces => 2},
      {:name => "Payday", :size => 2, :pieces => 1},
      {:name => "Mike and Ikes", :size => 2, :pieces => 15},
      {:name => "Crunch Bar", :size => 2, :pieces => 1},
      {:name => "Twizzlers", :size => 3, :pieces => 4}
    ]
  }

  it "has a name" do
    expect { Kid.create(:name => "Mitch") }.to_not raise_error
    expect(Kid.create(:name => "Mitch").name).to eq("Mitch")
  end

  it "has an age" do
    expect { Kid.create(:name => "Mitch", :age => 10) }.to_not raise_error
    expect(Kid.create(:name => "Mitch", :age => 10).age).to eq(10)
  end

  it "has an feeling" do
    expect { Kid.create(:name => "Stephanie", :feeling => "content") }.to_not raise_error
    expect(Kid.create(:name => "Stephanie", :feeling => "content").feeling).to eq("content")
  end

  let(:kid) { Kid.create(:name => "Stephanie", :age => 8) }

  it "has a bucket" do
    pail = Bucket.create(:kid_id => kid.id)
    expect(kid.bucket.id).to_not eq(pail.id)
  end

end
