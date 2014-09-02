require_relative 'spec_helper.rb'

describe PuppyBreeder::Breeder do
	let(:maker) { PuppyBreeder::Breeder.new("Jim") }
	let(:puppy) { PuppyBreeder::Puppy.new("Fred", "husky") }
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
		

		it "should add an instance of purchase request class & order in a hash to on hold list if puppy is not in list" do
			maker.add_purchase_request(puppy, buyer)
			expect(maker.pending_list.on_hold_list).to eq([{:dog => {puppy => buyer}, :rank => 1}])
		end

	end

	describe "#deny_request" do
		it "should deny a purchase request and remove it from the purchase request list" do
			maker.add_puppy(puppy)
			maker.add_purchase_request(puppy, buyer)
			maker.deny_request(puppy, buyer)
			expect(maker.breeder_request_list.purchase_request_list).to eq([])
		end

	end

	describe "complete_purchase" do

		context "the puppy and customer are in the purchase request list" do

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
		end

		context "the puppy and customer are not in the purchase request list" do
		
			it "should return false if there is not a purchase request" do
				maker.add_puppy(puppy)
				result = maker.complete_purchase(puppy, buyer)
				expect(result).to eq(false)
			end
		end
	
	end

end