#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
	attr_reader :name
	attr_reader :breed
	attr_accessor :id

  	def initialize(name, breed)
  		@name = name
  		@breed = breed
  		@id = nil
  	end

  end
end




