require 'spec_helper'

describe "House - Instance Methods" do

  let(:cottage) { House.create(:address=>"132 Seabridge Ln") }

  let(:kid) { Kid.create(:name => "Kristin", :age => 12) }
  let(:ali) { Kid.create(:name => "Ali", :age => 8) }
  let(:adult) { Kid.create(:name => "Spencer", :age => 18) }

  let(:claimed_candies) {
    [
      {:name => "Reeses", :size => 2, :pieces => 2},
      {:name => "M&Ms", :size => 3, :pieces => 20}
    ]
  }
  let(:unclaimed_candies) {
    [
      {:name => "Mike and Ikes", :size => 2, :pieces => 15},
      {:name => "Crunch Bar", :size => 2, :pieces => 1},
      {:name => "Twizzlers", :size => 3, :pieces => 4}
    ]
  }

  before(:each) do

    alis_bucket = Bucket.create(:kid_id => ali.id)
    kids_bucket = Bucket.create(:kid_id => kid.id)
    adults_bucket = Bucket.create(:kid_id => adult.id)

    claimed_candies.each do |candy_hash|
      candy_hash[:house_id] = cottage.id
      candy_hash[:bucket_id] = alis_bucket.id
      Candy.create(candy_hash)
    end

    unclaimed_candies.each do |candy_hash|
      candy_hash[:house_id] = cottage.id
      Candy.create(candy_hash)
    end
  end

  describe "#unclaimed_candies" do
    it "knows what candy hasn't been distributed yet (candies where bucket_id is nil)" do
      expect(cottage.unclaimed_candies.count).to eq(3)

      original_count = cottage.unclaimed_candies.count
      cottage.candies.last.update(:bucket_id => 1)
      
      found_cottage = House.find_by(:address => "132 Seabridge Ln")
      expect(found_cottage.unclaimed_candies.count).to eq(original_count - 1)
    end
  end

  describe "#give_candy" do

    it "accepts one argument, the kid that is trick-or-treating" do
      expect { cottage.give_candy(kid) }.not_to raise_error
    end

    it "returns 'Happy Halloween!' if a kid is younger than 18" do
      expect(cottage.give_candy(kid)).to eq("Happy Halloween!")
    end

    it "returns 'You're too old to trick-or-treat.' if a kid is 18 or older" do
      expect(cottage.give_candy(adult)).to eq("You're too old to trick-or-treat.")
    end

    it "can give candy to a kid" do
      original_count = kid.bucket.candies.count
      cottage.give_candy(kid)
      found_kid = Kid.find_by(:name => "Kristin")
      expect(found_kid.bucket.candies.count).to eq(original_count + 1)
    end

    it "does not pass out candy if the kid is 18 or older" do
      adults_candy_count = adult.bucket.candies.count
      unclaimed_candy_count = cottage.unclaimed_candies.count

      cottage.give_candy(adult)

      found_adult = Kid.find_by(:name => "Spencer")
      found_cottage = House.find_by(:address => "132 Seabridge Ln")
      expect(found_adult.bucket.candies.count).to eq(adults_candy_count)
      expect(found_cottage.unclaimed_candies.count).to eq(unclaimed_candy_count)
    end

    it "puts the first unclaimed candy into a kid's bucket" do
      cottage_num_of_unclaimed_candies = cottage.unclaimed_candies.count
      first_unclaimed_candy = cottage.unclaimed_candies.first
      expect(first_unclaimed_candy.bucket_id).to eq(nil)

      cottage.give_candy(kid)

      found_cottage = House.find_by(:address => "132 Seabridge Ln")
      first_unclaimed_candy.reload
      expect(first_unclaimed_candy.bucket_id).to eq(kid.bucket.id)
      expect(found_cottage.unclaimed_candies.count).to eq(cottage_num_of_unclaimed_candies - 1)
    end

  end

end
