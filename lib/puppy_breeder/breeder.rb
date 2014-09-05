#Refer to this class as PuppyBreeder::Breeder
module PuppyBreeder
  class Breeder

    attr_reader :breeder_name
    attr_accessor :id 

  	def initialize(breeder_name)
  		@breeder_name = breeder_name
      @id = nil
  	end
  	
  end

end