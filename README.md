# CouchRack

Utilities that simplify working with CouchDB from a Rack-based server, e.g. Sinatra.

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


If you use Guard, you can auto-publish views on change with this statement in your project's Guardfile:

    guard 'rake', :task => 'couchdb:views:push' do
      watch(%r|^db/_design/.+|)
    end

Depends on guard-rake.
