#Refer to this class as PuppyBreeder::Breeder
module PuppyBreeder
  class Breeder

    attr_reader :breeder_name
    attr_reader :puppy_list
  	attr_accessor :breeder_request_list
  	attr_reader :completed_purchase
  	attr_reader :breeders_customers
    # attr_reader :pending_list
    attr_accessor :id 

  	def initialize(breeder_name)
  		@breeder_name = breeder_name
  		@puppy_list = PuppyBreeder::PuppyList.new
  		@breeder_request_list = PuppyBreeder::PurchaseRequestList.new
  		@completed_purchase = {}
  		@breeders_customers = PuppyBreeder::CustomerList.new
      # @pending_list = PuppyBreeder::OnHold.new
      @id = nil
  	end

  	def add_puppy(puppy) #in puppy repo
      @puppy_list.list << puppy
      # check_puppy_in_pending(puppy)
    end

    # def check_puppy_in_pending(puppy)
    #   if @pending_list.on_hold_list.each do |x|
    #       x.each do |k, v|
    #        remove_from_pending(k, v) if k == puppy
    #       end
    #     end
    #   end
    # end

    # def remove_from_pending(puppy, customer)
    #     @pending_list.on_hold_list.delete({puppy => customer})
    #     @breeder_request_list.purchase_request_list << (PuppyBreeder::PurchaseRequest.new(puppy, customer)).purchase_request
    # end

    def add_purchase_request(puppy, customer) #in repo
  		if @puppy_list.list.include?(puppy)
        @breeder_request_list.purchase_request_list.each do |x|
          x.each do |k, v|
            if k == puppy
              return false
            end
          end
        end
        @breeder_request_list.purchase_request_list << (PuppyBreeder::PurchaseRequest.new(puppy, customer)).purchase_request
      else
        # @pending_list.on_hold_list << (PuppyBreeder::PurchaseRequest.new(puppy, customer)).purchase_request
      end
    end

    def deny_request(puppy, customer) #in repo
      @breeder_request_list.purchase_request_list.delete({puppy => customer})
    end

  	def complete_purchase(puppy, customer) #in repo
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