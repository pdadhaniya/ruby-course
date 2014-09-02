#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
	attr_reader :name
	attr_reader :breed

  	def initialize(name, breed)
  		@name = name
  		@breed = breed
  	end

  end
end




