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

	end

	describe "#add" do
		xit "should add puppy to the list" do
			expect((new_list.add(puppy)).length).to eq(1)
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

			xit "should change the status of a sold puppy to sold" do
				new_list.add(puppy)
				result = new_list.puppy_sold(puppy)
				expect(result.status).to eq("sold")
			end
		end


	end

	describe "#purchase_request" do 

		context "list includes a puppy" do
		
			xit "should make a request to purchase a puppy" do
				new_list.add(puppy)
				buyer.purchase_request(puppy, new_list)
				expect(buyer.pending_request).to eq("yes")
			end

			xit "should change the puppy's status to pending" do
				new_list.add(puppy)
				buyer.purchase_request(puppy, new_list)
				expect(puppy.status).to eq("pending")
			end

			xit "should add request to breeder's pending queue" do

			end

		end

		context "list doesn't include a puppy" do
		
			xit "should return false if list doesn't include a puppy" do		
				result = buyer.purchase_request(puppy, new_list)
				expect(result).to eq(false)
			end

		end

	end

	describe "complete_purchase" do
		
		context "there is a pending request" do

			xit "should check if pending request is yes and close the request to purchase a puppy" do
				new_list.add(puppy)
				buyer.purchase_request(puppy, new_list)
				buyer.complete_purchase(puppy, new_list)
				expect(buyer.pending_request).to eq("no")
			end

			xit "should remove request from breeder's queue" do

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

		end

		context "there is no pending request" do

			xit "should return false if there is not pending request" do
				new_list.add(puppy)
				result = buyer.complete_purchase(puppy, new_list)
				expect(result).to eq(false)
			end
		end
	end












end