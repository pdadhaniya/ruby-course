require_relative 'spec_helper.rb'

describe PuppyBreeder::PurchaseRequestList do
	let(:requestlist) { PuppyBreeder::PurchaseRequestList.new }

	describe "#initialize" do 
		it "should make a purchase request list" do
			expect(requestlist.purchase_request_list).to eq([])
			requestlist.purchase_request_list << "pup"
			expect(requestlist.purchase_request_list).to eq(["pup"])
		end
	end


























end