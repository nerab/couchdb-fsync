module CouchRack
  #
  # Maps from a Hash to View object
  #
  class ViewMapper
    def map(name, doc)
      View.new.tap do |view|
        view.name = name
        view.map_function = doc['map']
        view.reduce_function = doc['reduce']
      end
    end
  end
end
