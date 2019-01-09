# Adhoc fixtures are loaded on demand by tests that need them. Loading every
# fixture every time incurs a significant performance penalty; we can speed
# start and reload times by having a core set of important fixtures, and loading
# everything else as tests require.
#
# Basic usage in a test:
#
# require 'adhoc_fixtures'
#
#   before(:all) do
#     AdhocFixtures.load :users
#   end
#
# WARNING do NOT put this in a before(:each) unless you're in an integration test! In unit tests, calling AdhocFixtures.load
# in before(:each) will result in your fixtures getting deleted at the end of a test and NOT recreated at the beginning
# of the next. This is because ActiveRecord::FixtureSet.create_fixtures (which is deferred to under-the-hood) caches
# which fixtures it's loaded and will not reload them on subsequent calls. See https://github.com/rails/rails/blob/06ef4c3fa874f6dc166bce06d8158d9c5af78195/activerecord/lib/active_record/fixtures.rb#L543-L545
#
# Note Rails adds an automagic helper for files in spec/fixtures that does not
# exist for these tests. If you were doing this to fetch fixtures:
#
#   cb = content_blocks(:my_one)
#
# You'll need to replace it with this:
#
#   cb = AdhocFixtures.get(:content_blocks, :my_one)
#
module AdhocFixtures
  def self.load(*table_names)
    ActiveRecord::FixtureSet.create_fixtures(Rails.root.join('spec', 'adhoc_fixtures'), table_names)
  end
end
