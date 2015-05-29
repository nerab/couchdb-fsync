require 'helper'

class TestDesignDocumentMapper < CouchRack::TestCase
  def setup
    @mapper = CouchRack::DesignDocumentMapper.new
  end

  def test_structure
    doc = JSON.load(File.read(fixture('entries.json')))
    actual = @mapper.map(doc)
    assert_equal('entries', actual.name)
  end
end
