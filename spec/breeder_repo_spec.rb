require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::BreederRepo do
  let(:fred) { PuppyBreeder::Puppy.new("Fred", "collie")}
  let(:bob) { PuppyBreeder::Puppy.new("Bob", "pitbull")}
  let(:customer) { PuppyBreeder::Customer.new("Robert") }
  let(:breeder) { PuppyBreeder::Breeder.new("Puppymaster")}

  before(:each) do
    PuppyBreeder.purchase_repo.drop_tables
    PuppyBreeder.customer_repo.drop_tables
    PuppyBreeder.breeder_repo.drop_tables
    PuppyBreeder.puppy_repo.drop_tables
    PuppyBreeder.puppy_repo.create_tables
    PuppyBreeder.breeder_repo.create_tables
    PuppyBreeder.customer_repo.create_tables
    PuppyBreeder.purchase_repo.create_tables
  end

  describe "#add_breeder" do
    it "should update the breeder table with the name of the breeder" do
      result = PuppyBreeder.breeder_repo.add_breeder(breeder)
      expect(result.entries[0]["id"]).to eq('1')
      expect(result.entries[0]["name"]).to eq('Puppymaster')
    end
  end
  
end