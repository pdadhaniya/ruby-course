require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do
	describe "#initialize" do
		it "should make a new puppy" do
			result = PuppyBreeder::Puppy.new("Fred")
			expect(result.name).to eq("Fred")
		end

	end

end