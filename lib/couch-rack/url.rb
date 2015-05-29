module CouchRack
  def self.url(name = ENV.fetch('RACK_ENV', 'test'))
    JSON.parse(ENV['VCAP_SERVICES'])['cloudantNoSQLDB'].first['credentials']['url'] << '/' << name
  end
end
