#Refer to this class as PuppyBreeder::Customer
module PuppyBreeder
  class Customer

  	attr_reader :name, :purchase_request
    attr_accessor :id

  	def initialize(name)
  		@name = name
      @id = nil
  	end

  end
end