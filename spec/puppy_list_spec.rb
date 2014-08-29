require_relative 'spec_helper.rb'

describe PuppyBreeder::PuppyList do
	let(:list) { PuppyBreeder::PuppyList.new}
	let(:puppy) { PuppyBreeder::Puppy.new("Fred")}

	describe "#initialize" do
		it "should make a new puppy list" do
			result = PuppyBreeder::PuppyList.new
			expect(result.list).to eq([])
		end
	end

	describe "#add" do
		it "should add puppy to the list" do
			expect((list.add(puppy)).length).to eq(1)
		end
	end
end