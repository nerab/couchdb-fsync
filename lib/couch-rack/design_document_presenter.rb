module CouchRack
  class DesignDocumentPresenter
    def initialize(io = STDOUT)
      @io = io
    end

    def present(design_doc)
      @io.puts("Design Document '#{design_doc.name}':")

      design_doc.views.each do |view|
        @io.puts "  View '#{view.name}':"
        @io.puts "    map:"
        @io.puts view.map_function.indent(" " * 6)

        if view.reduce_function
          @io.puts "    reduce:"
          @io.puts view.reduce_function.indent(" " * 6)
        end
      end
    end
  end
end
