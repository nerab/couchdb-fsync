require 'dotenv/tasks'
require 'couchdb-fsync'
require 'couchrest'
require 'json'
require 'pathname'

namespace :couchdb do
  namespace :fsync do
    desc "Show views defined in the CouchDB instance"
    task :show => :database do
      ddp = CouchDB::FSync::DesignDocumentPresenter.new

      each_design_document(@db) do |doc|
        ddp.present(doc)
      end
    end

    desc "Pull views from the CouchDB instance and store them in the local file system"
    task :pull => :database do
      dds = CouchDB::FSync::DesignDocumentStore.new(Pathname('db/_design'))

      each_design_document(@db) do |doc|
        dds.save(doc)
      end
    end

    desc "Push views from the local file system to the CouchDB instance"
    task :push => :database do
      g = CouchDB::FSync::DesignDocumentGenerator.new

      Dir['db/_design/*'].each do |doc|
        view = JSON.load(g.generate(doc).to_json)

        begin
          @db.save_doc(view)
        rescue RestClient::Conflict => e
          doc = @db.get(view["_id"])
          doc.merge!(view)
          doc.save
        end
      end
    end

    task :database => :dotenv do
      @db = CouchRest.database!(ENV.fetch('COUCH_URL'))
    end
  end

  def each_design_document(db)
    ddm = CouchDB::FSync::DesignDocumentMapper.new

    db.all_docs(startkey: "_design/", endkey: "_design0", include_docs: true)['rows'].each do |row|
      yield ddm.map(row['doc'])
    end
  end
end
