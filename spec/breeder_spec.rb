require_relative 'spec_helper.rb'

describe PuppyBreeder::Breeder do
	let(:maker) { PuppyBreeder::Breeder.new("Jim") }
	let(:puppy) { PuppyBreeder::Puppy.new("Fred", "husky") }
	let(:buyer) { PuppyBreeder::Customer.new("David") }
	let(:buyer2) { PuppyBreeder::Customer.new("Phil") }

	describe "#initialize" do
		it "should make a new breeder" do
			expect(maker.breeder_name).to eq("Jim")
		end

	end

end