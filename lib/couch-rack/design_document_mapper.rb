module CouchRack
  #
  # Maps from a Hash to DesignDocument object
  #
  class DesignDocumentMapper
    def initialize
      @view_mapper = ViewMapper.new
    end

    def map(doc)
      DesignDocument.new.tap do |dd|
        dd.name = doc['_id'].split('/').last

        doc['views'].each do |view_name, functions|
          dd.views << @view_mapper.map(view_name, functions)
        end
      end
    end
  end
end
