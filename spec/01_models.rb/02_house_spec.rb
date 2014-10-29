require 'spec_helper'

describe "House" do

  it "has an address" do
    expect { House.create(:address => "132 Seabridge Ln") }.to_not raise_error
    expect(House.create(:address => "132 Seabridge Ln").address).to eq("132 Seabridge Ln")
  end

  let(:cottage)  { House.create(:address => "132 Seabridge Ln") }

  it "has many cadies" do
    skittles = Candy.create(:name => "Skittles", :house_id => cottage.id)
    m_and_ms = Candy.create(:name => "M&Ms", :house_id => cottage.id)
    expect { cottage.candies }.to_not raise_error
    [skittles, m_and_ms].each { |candy| expect(cottage.candies).to include(candy) }
  end

end
