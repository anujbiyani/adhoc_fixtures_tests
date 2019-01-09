require "rails_helper"

RSpec.describe "This test should have users" do
  before(:all) do
    AdhocFixtures.load :users
  end

  it "and does" do
    expect(User.count).to eq(1)
  end
end

RSpec.describe "This test should not have users" do
  it "but does" do
    expect(User.count).to eq(0)
  end
end
