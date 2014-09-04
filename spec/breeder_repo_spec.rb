require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::BreederRepo do
  let(:fred) { PuppyBreeder::Puppy.new("Fred", "collie")}
  let(:bob) { PuppyBreeder::Puppy.new("Bob", "pitbull")}
  let(:customer) { PuppyBreeder::Customer.new("Robert")}

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

  describe "#add_customer" do
    it "should update the customer table with name of the customer" do
      result = PuppyBreeder.breeder_repo.add_customer(customer)
      expect(result["id"]).to eq("1")
      expect(result["name"]).to eq("Robert")
    end
  end


  describe "#add_purchase_request" do
    it "should update the purchase request table with puppy, customer, and status" do
      PuppyBreeder.puppy_repo.add_puppy(fred)
      PuppyBreeder.breeder_repo.add_customer(customer)
      result = PuppyBreeder.breeder_repo.add_purchase_request(fred, customer)
      expect(result.entries[0]["id"]).to eq('1')
      expect(result.entries[0]["puppy"]).to eq('1')
      expect(result.entries[0]["customer"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('pending')
    end

  end






  
end