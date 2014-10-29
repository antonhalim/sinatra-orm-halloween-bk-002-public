require 'spec_helper'

describe "Candy" do

  it "has a name" do
    expect { Candy.create(:name => "Skittles") }.to_not raise_error
    expect(Candy.create(:name => "Skittles").name).to eq("Skittles")
  end

  it "has a number of pieces per package (pieces)" do
    expect { Candy.create(:pieces => 20) }.to_not raise_error
    expect(Candy.create(:pieces => 20).pieces).to eq(20)
  end

  it "has a size" do
    expect { Candy.create(:size => 3) }.to_not raise_error
    expect(Candy.create(:size => 3).size).to eq(3)
  end

  it "belongs to a house" do
    bk = House.create(:address => "432 Greene Ave. Brooklyn, NY")
    expect { Candy.create(:house_id => bk.id) }.to_not raise_error
    expect(Candy.create(:house_id => bk.id).house).to eq(bk)
  end

  it "belongs to a bucket" do
    kid = Kid.create(:name => "Harold", :age => 10)
    pail = Bucket.create(:kid_id => kid.id)
    expect { Candy.create(:bucket_id => pail.id) }.to_not raise_error
    expect(Candy.create(:bucket_id => pail.id).bucket).to eq(pail)
  end

end
