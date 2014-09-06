# we initialize the module here to use in our other files
module PuppyBreeder
	
	def self.puppy_repo=(x)
		@puppy_repo = x
	end
	
	def self.puppy_repo
		@puppy_repo
	end

	def self.breeder_repo=(y)
		@breeder_repo = y
	end

	def self.breeder_repo
		@breeder_repo
	end

	def self.purchase_repo=(z)
		@purchase_repo = z
	end

	def self.purchase_repo
		@purchase_repo
	end

	def self.customer_repo=(w)
		@customer_repo = w
	end

	def self.customer_repo
		@customer_repo
	end

	def self.breeds_repo=(v)
		@breeds_repo = v
	end

	def self.breeds_repo
		@breeds_repo
	end

	def self.breeds_request_repo=(u)
		@breeds_request_repo = u
	end

	def self.breeds_request_repo
		@breeds_request_repo
	end

end



require_relative 'puppy_breeder/puppy.rb'
require_relative 'puppy_breeder/breeder.rb'
require_relative 'puppy_breeder/customer.rb'
require_relative 'puppy_breeder/repos/breeder_repo.rb'
require_relative 'puppy_breeder/repos/puppy_repo.rb'
require_relative 'puppy_breeder/repos/purchase_request_repo.rb'
require_relative 'puppy_breeder/repos/customer_repo.rb'
require_relative 'puppy_breeder/repos/breeds_repo.rb'
require_relative 'puppy_breeder/repos/breeds_request_repo.rb'

PuppyBreeder.puppy_repo = PuppyBreeder::Repositories::PuppyRepo.new
PuppyBreeder.breeder_repo = PuppyBreeder::Repositories::BreederRepo.new
PuppyBreeder.purchase_repo = PuppyBreeder::Repositories::PurchaseRequestRepo.new
PuppyBreeder.customer_repo = PuppyBreeder::Repositories::CustomerRepo.new
PuppyBreeder.breeds_repo = PuppyBreeder::Repositories::BreedsRepo.new
PuppyBreeder.breeds_request_repo = PuppyBreeder::Repositories::BreedsRequestRepo.new



