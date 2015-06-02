# CouchDB::FSync

Sync CouchDB documents (incl. views) with the local file system.

## Views

### Map

    function(doc) {
      emit(doc._id, doc);
    }

### Reduce

    function(keys, values, rereduce) {
      return sum(values);
    }

## Rake Tasks

CouchDB::FSync comes with a number of Rake tasks that help pushing and pulling views between a CouchDB server and a local directory (`db/_design` by default). In order to use them, just add this line to your Rakefile:

    require 'couchdb-fsync/tasks'

If you use Guard, you can auto-publish views on change with this statement in your project's Guardfile:

    guard 'rake', :task => 'couchdb:fsync:push' do
      watch(%r|^db/_design/.+|)
    end

Depends on guard-rake.
