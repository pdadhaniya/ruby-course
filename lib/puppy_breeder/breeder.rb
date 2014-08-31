#Refer to this class as PuppyBreeder::Breeder
module PuppyBreeder
  class Breeder

    attr_reader :breeder_name
    attr_reader :puppy_list
  	attr_accessor :breeder_request_list
  	attr_reader :completed_purchase
  	attr_reader :breeders_customers

  	def initialize(breeder_name)
  		@breeder_name = breeder_name
  		@puppy_list = PuppyBreeder::PuppyList.new
  		@breeder_request_list = PuppyBreeder::PurchaseRequestList.new
  		@completed_purchase = {}
  		@breeders_customers = PuppyBreeder::CustomerList.new 
  	end

  	def add_puppy(puppy)
  		@puppy_list.list << puppy
  	end

    def add_purchase_request(puppy, customer)
  		if @puppy_list.list.include?(puppy)
      @breeder_request_list.purchase_request_list << (PuppyBreeder::PurchaseRequest.new(puppy, customer)).purchase_request
      else
        false
      end
    end

    def deny_request(puppy, customer)
      @breeder_request_list.purchase_request_list.delete({puppy => customer})
    end

  	def complete_purchase(puppy, customer)
      if @breeder_request_list.purchase_request_list.include?({puppy => customer})
  		  @completed_purchase[puppy] = customer
  		  @breeder_request_list.purchase_request_list.delete({puppy => customer})
  		  @breeders_customers.customer_list[customer] = puppy
  		  @puppy_list.list.delete(puppy)
      else
        false
      end
    end
  	
  end

end