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

end