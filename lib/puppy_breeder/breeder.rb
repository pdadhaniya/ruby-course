#Refer to this class as PuppyBreeder::Breeder
module PuppyBreeder
  class Breeder

    attr_reader :breeder_name
    attr_reader :puppy_list
  	attr_accessor :breeder_request_list
  	attr_reader :completed_purchase
  	attr_reader :breeders_customers
    attr_reader :pending_list
    attr_accessor :order

  	def initialize(breeder_name)
  		@breeder_name = breeder_name
  		@puppy_list = PuppyBreeder::PuppyList.new
  		@breeder_request_list = PuppyBreeder::PurchaseRequestList.new
  		@completed_purchase = {}
  		@breeders_customers = PuppyBreeder::CustomerList.new
      @pending_list = PuppyBreeder::OnHold.new
      @order = 0
  	end

  	def add_puppy(puppy)
  		@puppy_list.list << puppy
  	end

    # def complete_pending
    #   @pending_list.each do |x|
    # end

    def add_purchase_request(puppy, customer)
  		if @puppy_list.list.include?(puppy)
        @breeder_request_list.purchase_request_list << (PuppyBreeder::PurchaseRequest.new(puppy, customer)).purchase_request
      else
        @order += 1
        @pending_list.on_hold_list << { :dog => ((PuppyBreeder::PurchaseRequest.new(puppy, customer)).purchase_request), :rank => @order }
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