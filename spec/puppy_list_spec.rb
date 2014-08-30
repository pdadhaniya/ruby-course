require_relative 'spec_helper.rb'

describe PuppyBreeder::PuppyList do
	let(:new_list) { PuppyBreeder::PuppyList.new}
	# let(:puppy) { PuppyBreeder::Puppy.new("Fred")}

	describe "#initialize" do
		it "should make a new puppy list" do
			expect(new_list.list).to eq([])
			new_list.list << "a"
			expect(new_list.list).to eq(["a"])
		end

	end

end