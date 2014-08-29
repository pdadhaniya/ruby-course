#Refer to this class as PuppyBreeder::Customer
module PuppyBreeder
  class Customer

  	attr_reader :name
  	attr_reader :puppy_purchased
  	attr_reader :pending_request

  	def initialize(name)
  		@name = name
  		@puppy_purchased = []
  		@pending_request = "no"
  	end

  	def purchase_request(puppy, a_list)
  		if (a_list.list).include?(puppy)
  			@pending_request = "yes"
  			# puppy.status = "pending"
  		end
  	end
  end
end