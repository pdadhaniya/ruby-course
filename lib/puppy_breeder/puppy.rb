#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
	attr_reader :name  	

  	def initialize(name)
  		@name = name
  		@@all_puppies << self
  	end

  end
end



