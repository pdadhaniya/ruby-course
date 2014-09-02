#Refer to this class as PuppyBreeder::Customer
module PuppyBreeder
  class Customer

  	attr_reader :name
  	attr_reader :purchase_request

  	def initialize(name)
  		@name = name
  	end

  	def purchase_request(breeder, puppy)
        if breeder.puppy_list.list.include?(puppy)
        breeder.breeder_request_list.purchase_request_list << (PuppyBreeder::PurchaseRequest.new(puppy, self)).purchase_request
        else
          breeder.order += 1
          breeder.pending_list.on_hold_list << { :dog => ((PuppyBreeder::PurchaseRequest.new(puppy, self)).purchase_request), :rank => breeder.order }
        end
    end

  end
end