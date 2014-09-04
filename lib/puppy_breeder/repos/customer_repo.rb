require 'pg'

module PuppyBreeder
  module Repositories
    class CustomerRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
      end

      def add_customer(customer)
        if customer.id.nil?
          sql = "INSERT INTO customer( name ) VALUES ( '#{customer.name}' ) returning *"
          result = @db.exec(sql)
          customer.instance_variable_set("@id", (result[0]["id"]).to_i)
          result.first
        end
      end

      def drop_tables
        sql = "DROP TABLE customer"
        result = @db.exec(sql)
        result
      end

      def create_tables
        sql = "CREATE TABLE customer( id SERIAL, name TEXT, PRIMARY KEY ( id ) )"
        result = @db.exec(sql)
      end



    end
  end
end