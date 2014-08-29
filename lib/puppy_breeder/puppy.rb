#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
	attr_reader :name
	attr_accessor :status

  	def initialize(name)
  		@name = name
  		@status = "available"
  	end

  end
end



