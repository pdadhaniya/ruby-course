require_relative 'spec_helper.rb'

describe PuppyBreeder::PurchaseRequest do
	let(:puppy) { PuppyBreeder::Puppy.new("Fred")}
	let(:buyer) { PuppyBreeder::Customer.new("David") }

	describe "#initialize" do
		it "should make a new purchase request hash with puppy and customer" do
			result = PuppyBreeder::PurchaseRequest.new(puppy, buyer)
			expect(result.purchase_request).to eq({ puppy => buyer })
		end

	end



end