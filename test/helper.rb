$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'couch-rack'
require 'minitest/autorun'

module CouchRack
  class TestCase < MiniTest::Test
    def fixture(name)
      File.join(__dir__, 'fixtures', name)
    end
  end
end
