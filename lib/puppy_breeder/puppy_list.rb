#Refer to this class as PuppyBreeder::PuppyList
module PuppyBreeder
  class PuppyList

  	attr_accessor :list
  	attr_reader :sold_puppies

  	def initialize
  		@list = []
  		@sold_puppies = []
  	end

  	def add(puppy)
  		@list << puppy
  	end

  	def puppy_sold(puppy)
  		unless @list.include?(puppy)	
  			false
  		else
  			puppy.status = "sold"
  			@sold_puppies << puppy
  			@list.delete(puppy)
  			puppy
  		end
	end
  end
end