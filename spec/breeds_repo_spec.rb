require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::BreedsRepo do
  let(:breed1) { PuppyBreeder.breeds_repo.add_breed("collie", 7) }

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

  describe "#add_breed" do
    it "should add a breed and price into the breeds table" do #works
      result = PuppyBreeder.breeds_repo.add_breed("collie", 7)
      expect(result.entries[0]["breed"]).to eq('collie')
      expect(result.entries[0]["price"]).to eq('7')
    end #done
  end

  describe "#get_breed_id" do
    it "should return the id from the breeds table of the breed input" do #works
      breed1
      result = PuppyBreeder.breeds_repo.get_breed_id("collie")
      expect(result).to eq('1')
    end #done
  end















end