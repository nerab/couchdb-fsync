require 'couchdb-fsync/core_ext'

require 'couchdb-fsync/view'
require 'couchdb-fsync/view_mapper'
require 'couchdb-fsync/design_document_generator'
require 'couchdb-fsync/design_document'
require 'couchdb-fsync/design_document_mapper'
require 'couchdb-fsync/design_document_store'
require 'couchdb-fsync/design_document_presenter'

module CouchDB
  module FSync
    MAP_JS = 'map.js'
    REDUCE_JS = 'reduce.js'
  end
end
