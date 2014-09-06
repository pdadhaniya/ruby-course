require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::CustomerRepo do 
  let(:fred) { PuppyBreeder::Puppy.new("Fred", "collie")}
  let(:bob) { PuppyBreeder::Puppy.new("Bob", "pitbull")}
  let(:customer) { PuppyBreeder::Customer.new("Robert") }
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

  describe "#add_customer" do
    it "should update the customer table with name of the customer" do
      result = PuppyBreeder.customer_repo.add_customer(customer)
      expect(result["id"]).to eq("1")
      expect(result["name"]).to eq("Robert")
    end #done
  end


end