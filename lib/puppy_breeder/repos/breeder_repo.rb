require 'pg'
#Refer to this class as PuppyBreeder::Repositories::BreederRepo
module PuppyBreeder
	module Repositories
		class BreederRepo

			def initialize
				@db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
			end

      def add_breeder(breeder)
        if breeder.id.nil?
          sql = "INSERT INTO breeder( name ) VALUES ( '#{breeder.breeder_name}' ) returning *"
          result = @db.exec(sql)
          breeder.instance_variable_set("@id", (result[0]["id"]).to_i)
          result
        end
      end

      def drop_tables
        sql = "DROP TABLE breeder"
        result = @db.exec(sql)
        result
      end

      def create_tables
        sql = "CREATE TABLE breeder( id SERIAL, name text, PRIMARY KEY ( id ) )"
        result = @db.exec(sql)
      end

		end
	end
end