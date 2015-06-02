$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'couchdb-fsync'
require 'minitest/autorun'

module CouchDB::FSync
  class TestCase < MiniTest::Test
    def fixture(name)
      File.join(__dir__, 'fixtures', name)
    end
  end
end
