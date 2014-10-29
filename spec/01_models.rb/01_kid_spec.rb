require 'spec_helper'

describe "Kid" do

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
    expect(kid.bucket.id).to eq(pail.id)
  end

end
