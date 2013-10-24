require_relative '../spec_helper.rb'

describe "Kid" do

  let(:kid) { Kid.new }

  it "has a name" do
    kid.name = "Tyke"
    kid.name.should eq("Tyke")
  end

  it "has an age" do
    kid.age = 14
    kid.save
    k = Kid.find(:id => kid.id)
    k.age.should eq(kid.age)
  end

  it "has a bucket" do
    kid.save
    kid.bucket = Bucket.new
    kid.save
    kid.bucket.id.should_not eq(nil)
  end

  describe ".pig_out" do
    it "eats its candy" do
      pending
      # you'll need to set up a bucket and candy, then
      # call the .pig_out method
      # and return a status. The last line should be:
      # kid.pig_out.should eq("Happy") or similar
    end
    it "gets sick if it eats too much" do
      pending
      # set a threshold for how much candy will make you sick
      # then set up the bucket and candy. The last line should be:
      # kid.pig_out.should eq("Sick") or similar
    end
  end
end
