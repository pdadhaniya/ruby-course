require_relative 'spec_helper.rb'

describe PuppyBreeder::Customer do
	let(:puppy) { PuppyBreeder::Puppy.new("Fred")}
	let(:new_list) { PuppyBreeder::PuppyList.new}
	let(:buyer) { PuppyBreeder::Customer.new("David") }

	describe "#initialize" do
		it "should add a name and puppy purchased array for reach customer" do
			expect(buyer.name).to eq("David")
			expect(buyer.puppy_purchased).to eq([])
		end
	end

	describe "#purchase_request" do 

		context "list includes a puppy" do
		
			it "should make a request to purchase a puppy" do
				new_list.add(puppy)
				buyer.purchase_request(puppy, new_list)
				expect(buyer.pending_request).to eq("yes")
			end

			it "should change the puppy's status to pending" do
				new_list.add(puppy)
				buyer.purchase_request(puppy, new_list)
				expect(puppy.status).to eq("pending")
			end

			xit "should add request to breeder's pending queue" do

			end

		end

		context "list doesn't include a puppy" do
		
			it "should return false if list doesn't include a puppy" do		
				result = buyer.purchase_request(puppy, new_list)
				expect(result).to eq(false)
			end

		end

	end

	describe "complete_purchase" do
		
		context "there is a pending request" do

			it "should check if pending request is yes and close the request to purchase a puppy" do
				new_list.add(puppy)
				buyer.purchase_request(puppy, new_list)
				buyer.complete_purchase(puppy, new_list)
				expect(buyer.pending_request).to eq("no")
			end

			xit "should remove request from breeder's queue" do

			end

			it "should add puppy to puppy_purchased array" do
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

		end

		context "there is no pending request" do

			it "should return false if there is not pending request" do
				new_list.add(puppy)
				result = buyer.complete_purchase(puppy, new_list)
				expect(result).to eq(false)
			end
		end
	end

end