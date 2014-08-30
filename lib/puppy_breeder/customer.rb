#Refer to this class as PuppyBreeder::Customer
module PuppyBreeder
  class Customer

  	attr_reader :name
  	attr_reader :purchase_request

  	def initialize(name)
  		@name = name
  	end

  	def purchase_request(breeder, puppy)
        breeder.breeder_request_list.purchase_request_list << PuppyBreeder::PurchaseRequest.new(puppy, self)
  	end

  end
end