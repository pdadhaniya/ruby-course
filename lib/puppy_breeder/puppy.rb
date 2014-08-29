#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
	attr_reader :name
	attr_reader :status  	

  	def initialize(name)
  		@name = name
  		@status = "available"
  	end

  	def sold
  		@status = "sold"
  	end



  end
end



