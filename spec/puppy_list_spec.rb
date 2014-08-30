require_relative 'spec_helper.rb'

describe PuppyBreeder::PuppyList do
	let(:new_list) { PuppyBreeder::PuppyList.new}
	let(:puppy) { PuppyBreeder::Puppy.new("Fred")}

	describe "#initialize" do
		xit "should make a new puppy list" do
			expect(new_list.list).to eq([])
		end

		xit "should make a new sold puppies list" do
			expect(new_list.sold_puppies).to eq([])
		end
	end

	describe "#add" do
		xit "should add puppy to the list" do
			expect((new_list.add(puppy)).length).to eq(1)
		end
	end

	describe "#puppy_sold" do

		context "invalid; puppy not in list" do
			xit "returns false if the puppy is not in the list" do
				carl = PuppyBreeder::Puppy.new("Carl")
				result = new_list.puppy_sold(carl)
				expect(result).to eq(false)
			end
		end

		context "valid; puppy in the list" do
			xit "returns a puppy object" do
				new_list.add(puppy)
				result = new_list.puppy_sold(puppy)
				expect(result.name).to eq("Fred")
			end
			
			xit "should add the sold puppy to the sold puppy list and remove it from the other list" do
				new_list.add(puppy)
				expect(new_list.list).to eq([puppy])
				new_list.puppy_sold(puppy)
				expect(new_list.sold_puppies).to eq([puppy])
				expect(new_list.list).to eq([])
			end

			xit "should change the status of a sold puppy to sold" do
				new_list.add(puppy)
				result = new_list.puppy_sold(puppy)
				expect(result.status).to eq("sold")
			end
		end


	end

end