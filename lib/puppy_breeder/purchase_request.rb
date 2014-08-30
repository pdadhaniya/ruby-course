#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest

  	attr_accessor :purchase_request

  	def initialize(puppy, customer)
      @purchase_request = { puppy => customer }
  	end

    #get from customer
  	# def pending(puppy)
  	# 	@pending_puppies << puppy
  	# end

    #get from breeder
  	# def complete_request(puppy)
  	# 	@completed_puppies << puppy
  	# 	@pending_puppies.delete(puppy)
  	# end

  end
end