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
  			puppy.status = "pending"
  		else
  			false
  		end
  	end

  	def complete_purchase(puppy, a_list)
  		if @pending_request == "yes"
  			@pending_request = "no"
  			@puppy_purchased << puppy
  			a_list.puppy_sold(puppy)
  		else
  			false
  		end
  	end


  end
end