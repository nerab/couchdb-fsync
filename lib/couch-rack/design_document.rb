require 'json'

module CouchRack
  DesignDocument = Struct.new(:name, :views) do
    def views
      self[:views] ||= Array.new
    end

    def to_json(generator = nil)
      {
        _id: "_design/#{name}",
        views: views
      }.to_json(generator)
    end
  end
end
