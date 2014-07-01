require 'spec_helper'

describe "Candy" do
  let(:skittles) { Candy.create(:name => "Skittles", :size => 3, :pieces => 20) }
  it "has a name" do
    expect(skittles.name).to eq("Skittles")
  end

  it "has a number of pieces per package" do
    expect(skittles.pieces).to eq(20)
  end

  it "has a size" do
    expect(skittles.size).to eq(3)
  end
end
