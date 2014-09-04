require 'pg'
#Refer to this class as PuppyBreeder::Repositories::BreederRepo
module PuppyBreeder
	module Repositories
		class BreederRepo

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

      def add_purchase_request(puppy, customer)
        if puppy.id.nil?
          false
        else 
          sql = "INSERT INTO purchase_request( puppy, customer, status )
            VALUES ( '#{puppy.id}', '#{customer.id}', 'pending' ) RETURNING *"
          result = @db.exec(sql)
        end
      end


      def drop_tables_breeder
        sql = "DROP TABLE breeder"
        result = @db.exec(sql)
        result
      end

      def drop_tables_customer
        sql = "DROP TABLE customer"
        result = @db.exec(sql)
        result
      end

      def create_tables_breeder
        sql = "CREATE TABLE breeder( id SERIAL, name text, PRIMARY KEY ( id ) )"
        result = @db.exec(sql)
      end

      def create_tables_customer
        sql = "CREATE TABLE customer( id SERIAL, name text, PRIMARY KEY ( id ) )"
        result = @db.exec(sql)
      end


		end
	end
end