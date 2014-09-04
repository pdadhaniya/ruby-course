#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest

  	attr_accessor :purchase_request
  	attr_accessor :status

  	def initialize(puppy, customer)
      @purchase_request = { puppy => customer }
      @status = "pending"
  	end

  end
end