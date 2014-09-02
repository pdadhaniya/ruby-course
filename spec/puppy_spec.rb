require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do
	let(:puppy) { PuppyBreeder::Puppy.new("Fred", "husky")}

	describe "#initialize" do
		it "should make a new puppy" do
			expect(puppy.name).to eq("Fred")
			expect(puppy.breed).to eq("husky")
		end

	end

end