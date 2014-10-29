require 'spec_helper'

describe "Bucket" do

  let(:tristan) { Kid.create(:name => "Tristan", :age => 14) }

  it "belongs to a kid" do
    expect { Bucket.create(:kid_id => tristan.id) }.to_not raise_error
    expect(Bucket.create(:kid_id => tristan.id).kid).to eq(tristan)
  end

  let(:tristans_pail) { Bucket.create(:kid_id => tristan.id) }

  it "can contain candy" do
    expect { tristans_pail.candies }.to_not raise_error
    original_count = tristans_pail.candies.count

    skittles = Candy.create(:name => "Skittles", :size => 3, :pieces => 20)
    redhots = Candy.create(:name => "Redhots", :size => 3, :pieces => 20)
    tristans_pail.candies << [skittles, redhots]

    found_bucket = Bucket.find_by(:kid_id => tristan.id)
    expect(found_bucket.candies.count).to eq(original_count + 2)
    [skittles, redhots].each { |candy| expect(found_bucket.candies).to include(candy) }
  end

end
