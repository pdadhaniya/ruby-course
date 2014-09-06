require 'pg'

module PuppyBreeder
  module Repositories
    class BreedsRequestRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
      end

      def update_breeds_request(pr_id, breed)
        command = <<-SQL
        INSERT INTO breeds_request( purchase_request_id, breeds_id )
        VALUES ( '#{pr_id}', '#{breed}' )
        RETURNING *;
        SQL
        result = @db.exec(command)
      end



      def drop_tables
        sql = "DROP TABLE breeds_request"
        result = @db.exec(sql)
      end

      def create_tables
        sql = "CREATE TABLE breeds_request( id SERIAL, purchase_request_id INTEGER REFERENCES purchase_request ( id ), breeds_id INTEGER REFERENCES breeds ( id ), PRIMARY KEY( id ) )"
        result = @db.exec(sql)
      end


    end
  end
end