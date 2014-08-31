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

		xit "should add puppy to puppy_purchased array" do
			new_list.add(puppy)
			buyer.purchase_request(puppy, new_list)
			buyer.complete_purchase(puppy, new_list)
			expect(buyer.puppy_purchased).to eq([puppy])
		end

		xit "should run the puppy sold method from the puppy list class" do
			new_list.add(puppy)
			buyer.purchase_request(puppy, new_list)
			buyer.complete_purchase(puppy, new_list)
			expect(puppy.status).to eq("sold")
		end

		xit "should return false if there is not pending request" do
			new_list.add(puppy)
			result = buyer.complete_purchase(puppy, new_list)
			expect(result).to eq(false)
		end
	end

	describe "#puppy_sold" do

		context "invalid; puppy not in list" do
			xit "returns false if the puppy is not in the list" do
				carl = PuppyBreeder::Puppy.new("Carl")
				result = new_list.puppy_sold(carl)
				expect(result).to eq(false)
			end
		end

		context "valid; puppy in the list" do
			xit "returns a puppy object" do
				new_list.add(puppy)
				result = new_list.puppy_sold(puppy)
				expect(result.name).to eq("Fred")
			end
			
			xit "should add the sold puppy to the sold puppy list and remove it from the other list" do
				new_list.add(puppy)
				expect(new_list.list).to eq([puppy])
				new_list.puppy_sold(puppy)
				expect(new_list.sold_puppies).to eq([puppy])
				expect(new_list.list).to eq([])
			end

		end


	end













end