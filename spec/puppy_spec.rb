require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do
	let(:puppy) { PuppyBreeder::Puppy.new("Fred")}

	describe "#initialize" do
		it "should make a new puppy" do
			expect(puppy.name).to eq("Fred")
		end
	end

	describe "#sold" do
		it "should sell a puppy" do
			expect(puppy.sold).to eq("sold")
		end
	end

end