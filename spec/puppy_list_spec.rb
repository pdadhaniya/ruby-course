require_relative 'spec_helper.rb'

describe PuppyBreeder::PuppyList do
	describe "#initialize" do
		it "should make a new puppy list" do
			result = PuppyBreeder::PuppyList.new
			expect(result.list).to eq([])
		end
	end
end