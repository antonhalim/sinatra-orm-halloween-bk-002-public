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

  it "has a bucket" do
    kid.save
    kid.bucket = Bucket.new
    kid.save
    expect(kid.bucket.id).to_not eq(nil)
  end

  describe ".pig_out" do
    it "eats its candy" do
      # You'll need to set up a bucket and candy, then
      # call the .pig_out method and return a status.
      # The last line should be: kid.pig_out.should eq("Happy") or similar

      pending
    end
    it "gets sick if it eats too much" do
      # Set a threshold for how much candy will make you sick
      # then set up the bucket and candy. The last line should be:
      # kid.pig_out.should eq("Sick") or similar

      pending
    end
  end
end
