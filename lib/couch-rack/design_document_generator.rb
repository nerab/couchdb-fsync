require 'pathname'

module CouchRack
  #
  # Builds CouchDB design documents
  #
  class DesignDocumentGenerator
    def generate(base_directory_name)
      base_dir = Pathname.new(base_directory_name)

      views = base_dir.children.map do |dir|
        v = View.new
        v.name = dir.basename
        v.map_function = map_function(dir)
        v.reduce_function = reduce_function(dir)

        [v.name, v]
      end

      DesignDocument.new.tap do |dd|
        dd.name = base_dir.basename
        dd.views = views.to_h
      end
    end

  private

    def map_function(base_dir)
      read_or_nil(base_dir, MAP_JS)
    end

    def reduce_function(base_dir)
      read_or_nil(base_dir, REDUCE_JS)
    end

    def read_or_nil(base_dir, name)
      function_file = base_dir.join(name)

      if function_file.exist?
        function_file.read
      else
        nil
      end
    end
  end
end
