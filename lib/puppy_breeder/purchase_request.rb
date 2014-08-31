#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest

  	attr_accessor :purchase_request

  	def initialize(puppy, customer)
      @purchase_request = { puppy => customer }
  	end

  end
end