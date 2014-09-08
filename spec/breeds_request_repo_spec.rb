require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::BreedsRequestRepo do
  let(:fred) { PuppyBreeder::Puppy.new("Fred", "collie")}
  let(:bob) { PuppyBreeder::Puppy.new("Bob", "pitbull")}
  let(:customer) { PuppyBreeder::Customer.new("Robert") }
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
    PuppyBreeder.customer_repo.add_customer(customer)
    PuppyBreeder.breeder_repo.add_breeder(breeder)
  end


  describe "view_breeds_request" do
    it "should show the breeds request table" do
      breed1
      PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
      PuppyBreeder.purchase_repo.add_purchase_request(['collie'], customer)
      result = PuppyBreeder.breeds_request_repo.view_breeds_request
      expect(result.entries[0]["id"]).to eq('1')
      expect(result.entries[0]["purchase_request_id"]).to eq('1')
      expect(result.entries[0]["breeds_id"]).to eq('1')
    end
  end

  # describe "#update_breeds_request" do
  #   xit "should update the breeds_request table with purchase request id and breed id" do
  #     customer
  #     PuppyBreeder.customer_repo.add_customer(customer)
  #     breed1
  #     breed2
  #     PuppyBreeder.breeder_repo.add_breeder(breeder)
  #     PuppyBreeder.breeds_repo.add_breed("collie", 7)
  #     PuppyBreeder.purchase_repo.add_purchase_request(['collie'], customer)
  #   end
  # end













  
end