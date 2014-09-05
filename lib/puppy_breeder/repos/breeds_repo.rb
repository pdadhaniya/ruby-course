require 'pg'

module PuppyBreeder
  module Repositories
    class BreedsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
      end

      def add_breed(breed, price)
        sql = "INSERT INTO breeds( breed, price ) VALUES ( '#{breed}', '#{price}' ) returning *"
        result = @db.exec(sql)
      end

      def get_breed_id(breed)
        sql = "SELECT * FROM breeds WHERE breed='#{breed}'"
        result = @db.exec(sql)
        id = result[0]["id"]
        id
      end


      def drop_tables
        sql = "DROP TABLE breeds"
        result = @db.exec(sql)
      end

      def create_tables
        sql = "CREATE TABLE breeds( id SERIAL, breed TEXT, price INTEGER, PRIMARY KEY( id ) )"
        result = @db.exec(sql)
      end

    end
  end
end