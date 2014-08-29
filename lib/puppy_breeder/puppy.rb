#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
	attr_reader :name  	

	@@all_puppies = []

  	def initialize(name)
  		@name = name
  	end

  	def self.list
  		@@all_puppies
  	end

  end
end



