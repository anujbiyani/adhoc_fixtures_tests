require "rails_helper"

RSpec.describe "Before each does not work" do
  before(:each) do
    AdhocFixtures.load :users
  end

  it "has users" do
    expect(User.count).to eq(1)
  end

  # https://github.com/rails/rails/blob/v5.2.2/activerecord/lib/active_record/fixtures.rb#L538
  it "should have users but doesn't because ActiveRecord::FixtureSet thinks this fixture has already been loaded so it won't reload it" do
    expect(User.count).to eq(1)
  end
end

RSpec.describe "This test should have users" do
  before(:all) do
    AdhocFixtures.load :users
  end

  # https://github.com/rails/rails/blob/v5.2.2/activerecord/lib/active_record/fixtures.rb#L538
  it "but doesn't because ActiveRecord::FixtureSet thinks this fixture has already been loaded so it won't reload it" do
    expect(User.count).to eq(1)
  end
end
