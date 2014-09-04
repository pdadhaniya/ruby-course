require_relative 'spec_helper.rb'

describe PuppyBreeder::Customer do
	let(:puppy) { PuppyBreeder::Puppy.new("Fred", "husky")}
	let(:maker) { PuppyBreeder::Breeder.new("Jim") }
	let(:buyer) { PuppyBreeder::Customer.new("David") }
	let(:buyer2) { PuppyBreeder::Customer.new("Paul")}

	describe "#initialize" do
		it "should add a name for each customer" do
			expect(buyer.name).to eq("David")
			expect(buyer2.name).to eq("Paul")
		end
	end

	describe "#purchase_request" do
		it "should add an instance of the purchase request class to the purchase request list" do
			maker.add_puppy(puppy)
			buyer.purchase_request(maker, puppy)
			expect(maker.breeder_request_list.purchase_request_list).to eq([{puppy => buyer}])
		end

		it "should return false if a purchase request is made for a puppy already in the purchase request list" do
			maker.add_puppy(puppy)
			buyer.purchase_request(maker, puppy)
			expect(buyer2.purchase_request(maker, puppy)).to eq(false)
		end


		# it "should add an instance of purchase request class & order in a hash to on hold list if puppy is not in list" do
		# 	buyer.purchase_request(maker, puppy)
		# 	expect(maker.pending_list.on_hold_list).to eq([{puppy => buyer}])
		# end

	end

end