require_relative 'spec_helper.rb'

describe PuppyBreeder::PuppyList do
	let(:new_list) { PuppyBreeder::PuppyList.new}
	let(:puppy) { PuppyBreeder::Puppy.new("Fred")}

	describe "#initialize" do
		it "should make a new puppy list" do
			expect(new_list.list).to eq([])
		end

		it "should make a new sold puppies list" do
			expect(new_list.sold_puppies).to eq([])
		end
	end

	describe "#add" do
		it "should add puppy to the list" do
			expect((new_list.add(puppy)).length).to eq(1)
		end
	end

	describe "#puppy_sold" do

		context "valid; puppy in the list" do
			xit 'returns a puppy object' do
				result = new_list.puppy_sold(puppy)
				expect(result.name).to eq("Fred")
			end
			
			it "should add the sold puppy to the sold puppy list and remove it from the other list" do
				new_list.add(puppy)
				expect(new_list.list).to eq([puppy])
				new_list.puppy_sold(puppy)
				expect(new_list.sold_puppies).to eq([puppy])
				expect(new_list.list).to eq([])
			end
		end

		context "invalid; puppy not in list" do

		end

	end

end