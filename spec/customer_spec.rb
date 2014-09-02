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

		it "should return false if puppy list doesn't include a puppy" do
			result = buyer.purchase_request(maker, puppy)
			expect(result).to eq(false)
		end

	end

end