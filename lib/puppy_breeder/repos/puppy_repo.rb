require 'pg'
#Refer to this class as PuppyBreeder::Repositories::PuppyRepo
module PuppyBreeder
	module Repositories
		class PuppyRepo

			def initialize
				@db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
			end

			def add_puppy(puppy)
				if puppy.id.nil?
					sql = "INSERT INTO puppies( name, breed ) VALUES ( '#{puppy.name}', '#{puppy.breed}' ) returning id"
					result = @db.exec(sql)
					puppy.instance_variable_set("@id", (result[0]["id"]).to_i)
					result.values
				else
					sql = "UPDATE puppies SET (name, breed ) = ( '#{puppy.name}', '#{puppy.breed}' ) WHERE id='#{puppy.id}' returning id"
					result = @db.exec(sql)
					result.values
				end
			end

			def remove_puppy(puppy)
				sql = "DELETE FROM puppies WHERE id='#{puppy.id}' returning id"
				result = @db.exec(sql)
				result
			end

			def drop_tables
				sql = "DROP TABLE puppies"
				result = @db.exec(sql)
				result
			end

			def create_tables
				sql = "CREATE TABLE puppies( id SERIAL, name text, breed text, PRIMARY KEY( id ) )"
				result = @db.exec(sql)
			end


		end
	end
end