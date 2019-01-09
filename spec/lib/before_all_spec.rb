require "rails_helper"

RSpec.describe "Before all does work" do
  before(:all) do
    AdhocFixtures.load :users
  end

  it "has users" do
    expect(User.count).to eq(1)
  end

  it "also has users" do
    expect(User.count).to eq(1)
  end
end
