require 'pg'
#Refer to this class as PuppyBreeder::Repositories::PuppyRepo
module PuppyBreeder
	module Repositories
		class PuppyRepo

			def initialize
				@db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
			end

			def add_puppy(puppy, breeder) #update
				if puppy.id.nil?
					breed = PuppyBreeder.breeds_repo.get_breed_id(puppy.breed)
					sql = "INSERT INTO puppies( name, breed_id, status, breeder_id ) VALUES ( '#{puppy.name}', '#{breed}', 'available', '#{breeder.id}' ) returning id"
					result = @db.exec(sql)
					puppy.instance_variable_set("@id", (result[0]["id"]).to_i)
					result.values
				else
					breed = PuppyBreeder.breeds_repo.get_breed_id(puppy.breed)
					sql = "UPDATE puppies SET (name, breed_id, status, breeder_id ) = ( '#{puppy.name}', '#{breed}', 'available', '#{breeder.id}' ) WHERE id='#{puppy.id}' returning id"
					result = @db.exec(sql)
					result.values
				end
			end

			def remove_puppy(puppy) #remove?
				sql = "DELETE FROM puppies WHERE id='#{puppy.id}' returning id"
				result = @db.exec(sql)
				result
			end

			def drop_tables
				sql = "DROP TABLE puppies"
				result = @db.exec(sql)
			end

			def create_tables
				sql = "CREATE TABLE puppies( id SERIAL, name TEXT, breed_id INTEGER REFERENCES breeds ( id ), status TEXT, breeder_id INTEGER REFERENCES breeder ( id ), PRIMARY KEY( id ) )" #need to test new fields
				result = @db.exec(sql)
			end


		end
	end
end