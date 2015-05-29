require 'helper'
require 'couch-rack/design_document_generator'

class TestDesignDocumentGenerator < CouchRack::TestCase
  def setup
    @generator = CouchRack::DesignDocumentGenerator.new
  end

  def test_structure
    doc = JSON.load(@generator.generate(File.join(__dir__, '../fixtures/db/_design/entries')).to_json)

    assert(doc)
    refute_empty(doc)
    assert_equal('_design/entries', doc['_id'])

    views = doc['views']
    assert(views)
    assert_equal(2, views.size)

    all = views['all']
    assert(all)
    assert_equal(1, all.size)

    map = all['map']
    assert(map)
    refute_empty(map)

    assert_equal(JSON.load(File.read(fixture('entries.json'))), doc)
  end
end
