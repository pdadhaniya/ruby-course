require_relative 'spec_helper.rb'

describe PuppyBreeder::Breeder do
	let(:maker) { PuppyBreeder::Breeder.new("Jim") }
	let(:puppy) { PuppyBreeder::Puppy.new("Fred") }
	let(:buyer) { PuppyBreeder::Customer.new("David") }

	describe "#initialize" do
		it "should make a new breeder" do
			expect(maker.breeder_name).to eq("Jim")
		end

		it "should make a new instance of the puppy list class" do
			expect(maker.puppy_list.list).to eq([])
		end

		it "should make a new instance of the purchase request list class" do
			expect(maker.breeder_request_list.purchase_request_list).to eq([])
		end

		it "should make an empty hash for completed purchases" do
			expect(maker.completed_purchase).to eq({})
		end

		it "should make a new instance of the customer list class" do
			expect(maker.breeders_customers.customer_list).to eq({})
		end

	end

	describe "#add" do
		it "should add puppy to the puppy list" do
			maker.add_puppy(puppy) 
			expect(maker.puppy_list.list).to eq([puppy])
		end
	end

	describe "#add_purchase_request" do 
		
		it "should add an instance of purchase request class to purchase request list" do
			maker.add_puppy(puppy)
			maker.add_purchase_request(puppy, buyer)
			expect(maker.breeder_request_list.purchase_request_list).to eq([{puppy => buyer}])
		end
		
		xit "should return false if list doesn't include a puppy" do		
			result = buyer.purchase_request(puppy, new_list)
			expect(result).to eq(false)
		end

	end	

	describe "complete_purchase" do

		it "should add puppy key and custoemr value to completed purchase hash" do
			maker.add_puppy(puppy)
			maker.add_purchase_request(puppy, buyer)
			maker.complete_purchase(puppy, buyer)
			expect(maker.completed_purchase).to eq({ puppy => buyer })
		end

		it "should remove the puppy and customer from the purchase request list" do
			maker.add_puppy(puppy)
			maker.add_purchase_request(puppy, buyer)
			maker.complete_purchase(puppy, buyer)
			expect(maker.breeder_request_list.purchase_request_list).to eq([])
		end

		it "should add a customer key and puppy value to the customer list" do
			maker.add_puppy(puppy)
			maker.add_purchase_request(puppy, buyer)
			maker.complete_purchase(puppy, buyer)
			expect(maker.breeders_customers.customer_list).to eq({ buyer => puppy })
		end

		it "should remove the puppy from the puppy list" do
			maker.add_puppy(puppy)
			maker.add_purchase_request(puppy, buyer)
			maker.complete_purchase(puppy, buyer)
			expect(maker.puppy_list.list).to eq([])
		end
		
		xit "should check if pending request is yes and close the request to purchase a puppy" do
			new_list.add(puppy)
			buyer.purchase_request(puppy, new_list)
			buyer.complete_purchase(puppy, new_list)
			expect(buyer.pending_request).to eq("no")
		end

		it "should return false if there is not a purchase request" do
			maker.add_puppy(puppy)
			result = maker.complete_purchase(puppy, buyer)
			expect(result).to eq(false)
		end
	end

end