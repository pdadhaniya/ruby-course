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

			xit "should change the puppy's status to pending" do

			end

			xit "should add request to breeder's pending queue" do

			end

		end
	end

	describe "complete_purchase" do
		xit "should close the request to purchase a puppy" do

		end

		xit "should change the puppy's status to sold" do

		end

		xit "should remove request from breeder's queue" do

		end

		xit "should add puppy to puppy_purchased array" do

		end

	end

end