require_relative 'spec_helper.rb'

describe PuppyBreeder::CustomerList do
	let(:list_of_customers) { PuppyBreeder::CustomerList.new }

	describe "#initialize" do
		it "should make a new customer list hash" do
			expect(list_of_customers.customer_list).to eq({})
			list_of_customers.customer_list["a"] = "b"
			expect(list_of_customers.customer_list).to eq({"a" => "b"})
		end
	end


end