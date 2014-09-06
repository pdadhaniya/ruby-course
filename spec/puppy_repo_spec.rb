require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::PuppyRepo do
	let(:fred) { PuppyBreeder::Puppy.new("Fred", "collie")}
	let(:bob) { PuppyBreeder::Puppy.new("Bob", "pitbull")}
  let(:breed1) { PuppyBreeder.breeds_repo.add_breed("collie", 7) }
  let(:breed2) { PuppyBreeder.breeds_repo.add_breed("pitbull", 3) }
  let(:breeder) { PuppyBreeder::Breeder.new("Puppymaster")}

	before(:each) do
    PuppyBreeder.breeds_request_repo.drop_tables
    PuppyBreeder.purchase_repo.drop_tables
    PuppyBreeder.puppy_repo.drop_tables
    PuppyBreeder.breeds_repo.drop_tables
    PuppyBreeder.breeder_repo.drop_tables
    PuppyBreeder.customer_repo.drop_tables
    PuppyBreeder.customer_repo.create_tables
    PuppyBreeder.breeder_repo.create_tables
    PuppyBreeder.breeds_repo.create_tables
    PuppyBreeder.puppy_repo.create_tables
    PuppyBreeder.purchase_repo.create_tables
    PuppyBreeder.breeds_request_repo.create_tables
	end

	describe "#add_puppy" do
		it "should add a puppy name, breed_id, status, and breeder_id to the database if it isn't already there" do
      PuppyBreeder.breeder_repo.add_breeder(breeder)
      breed1
			result = PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
      expect(result).to eq([["1"]])
    end #done

		it "should update the puppies table and not add another record if puppy is already in database" do
			PuppyBreeder.breeder_repo.add_breeder(breeder)
      breed1
      breed2
      PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
			PuppyBreeder.puppy_repo.add_puppy(bob, breeder)
      result = PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
			expect(result).to eq([["1"]])
		end #done
	end






end