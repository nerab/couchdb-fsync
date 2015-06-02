module CouchDB::FSync
  class DesignDocumentStore
    def initialize(base_dir)
      @base_dir = base_dir
    end

    def save(doc)
      doc.views.each do |view|
        view_dir = @base_dir.join(doc.name, view.name)
        view_dir.mkpath

        File.write(view_dir.join(MAP_JS), view.map_function)

        if view.reduce_function && !view.reduce_function.empty?
          File.write(view_dir.join(REDUCE_JS), view.reduce_function)
        end
      end
    end
  end
end
