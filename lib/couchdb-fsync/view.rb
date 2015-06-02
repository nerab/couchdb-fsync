require 'json'

module CouchDB::FSync
  View = Struct.new(:name, :map_function, :reduce_function) do
    def to_json(generator = nil)
      {
        map: map_function,
        reduce: reduce_function,
      }.compact(recurse: true).to_json(generator)
    end
  end
end
