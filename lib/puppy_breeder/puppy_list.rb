#Refer to this class as PuppyBreeder::PuppyList
module PuppyBreeder
  class PuppyList

  	attr_accessor :list

  	def initialize
  		@list = []
  		# @sold_puppies = []
  	end

    #moved to breeder
  	# def add(puppy)
  	# 	@list << puppy
  	# end

    #check if sold
  	# def puppy_sold(puppy)
  	# 	# unless @list.include?(puppy)	
  	# 	# 	false
  	# 	# else
  	# 	# 	puppy.status = "sold"
  	# 	# 	@sold_puppies << puppy
  	# 	# 	@list.delete(puppy)
  	# 	# 	puppy
  	# 	end
  end
end