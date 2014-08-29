#Refer to this class as PuppyBreeder::Customer
module PuppyBreeder
  class Customer

  	attr_reader :name
  	attr_reader :puppy_purchased
  
  	def initialize(name)
  		@name = name
  		@puppy_purchased = []
  	end


  end
end