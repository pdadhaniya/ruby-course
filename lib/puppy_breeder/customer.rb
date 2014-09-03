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
          breeder.breeder_request_list.purchase_request_list.each do |x|
            x.each do |k, v|
              if k == puppy
                return false
              end
            end
          end
        breeder.breeder_request_list.purchase_request_list << (PuppyBreeder::PurchaseRequest.new(puppy, self)).purchase_request
        else
          breeder.pending_list.on_hold_list << (PuppyBreeder::PurchaseRequest.new(puppy, self)).purchase_request
        end
    end

  end
end