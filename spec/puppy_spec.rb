require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do
	let(:puppy) { PuppyBreeder::Puppy.new("Fred")}

	describe "#initialize" do
		xit "should make a new puppy" do
			expect(puppy.name).to eq("Fred")
		end

		xit "should make a new puppy's status as available" do
			expect(puppy.status).to eq("available")
		end
	end

end