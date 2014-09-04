require 'pg'

module PuppyBreeder
  module Repositories
    class PurchaseRequestRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
      end











      def drop_tables
        sql = "DROP TABLE purchase_request"
        result = @db.exec(sql)
        result
      end

      def create_tables
        sql = "CREATE TABLE purchase_request( id SERIAL, puppy INTEGER REFERENCES puppies ( id ), customer INTEGER REFERENCES customer ( id ), status TEXT, PRIMARY KEY( id ) )"
        result = @db.exec(sql)
      end

    end
  end
end