require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do
	describe "#initialize" do
		it "should make a new puppy" do
			result = PuppyBreeder::Puppy.new("Fred")
			expect(result.name).to eq("Fred")
		end
	end

	describe ".list" do
		it "should return no puppies if there are no puppies" do
			result = PuppyBreeder::Puppy.list
			expect(result).to eq([])
		end
	end

end