require "rails_helper"

RSpec.describe "Destroying works in before(:each)" do
  before(:all) do
    AdhocFixtures.load :users
  end

  context "because the destroy is in a transaction that gets rolled back" do
    before do
      User.destroy_all
    end

    it "has no users" do
      expect(User.count).to eq(0)
    end
  end

  it "here we have users" do
    expect(User.count).to eq(1)
  end
end
