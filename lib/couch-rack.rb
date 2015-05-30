require 'couch-rack/core_ext'

require 'couch-rack/view'
require 'couch-rack/view_mapper'
require 'couch-rack/design_document_generator'
require 'couch-rack/design_document'
require 'couch-rack/design_document_mapper'
require 'couch-rack/design_document_store'
require 'couch-rack/design_document_presenter'

module CouchRack
  MAP_JS = 'map.js'
  REDUCE_JS = 'reduce.js'
end
