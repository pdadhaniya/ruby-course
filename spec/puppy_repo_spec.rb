require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::PuppyRepo do
	let(:fred) { PuppyBreeder::Puppy.new("Fred", "collie")}
	let(:bob) { PuppyBreeder::Puppy.new("Bob", "pitbull")}

	before(:each) do
    PuppyBreeder.purchase_repo.drop_tables
    PuppyBreeder.breeder_repo.drop_tables_customer
    PuppyBreeder.breeder_repo.drop_tables_breeder
		PuppyBreeder.puppy_repo.drop_tables
		PuppyBreeder.puppy_repo.create_tables
    PuppyBreeder.breeder_repo.create_tables_breeder
    PuppyBreeder.breeder_repo.create_tables_customer
    PuppyBreeder.purchase_repo.create_tables
	end

	describe "#add_puppy" do
		it "should add a puppy to the database if it isn't already there" do
			expect(PuppyBreeder.puppy_repo.add_puppy(fred)).to eq([["1"]])
    end

		it "should update the puppies table and not add another record if puppy is already in database" do
			PuppyBreeder.puppy_repo.add_puppy(fred)
			PuppyBreeder.puppy_repo.add_puppy(bob)
			expect(PuppyBreeder.puppy_repo.add_puppy(fred)).to eq([["1"]])
		end
	end






end