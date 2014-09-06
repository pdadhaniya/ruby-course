require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::BreederRepo do
  let(:fred) { PuppyBreeder::Puppy.new("Fred", "collie")}
  let(:bob) { PuppyBreeder::Puppy.new("Bob", "pitbull")}
  let(:customer) { PuppyBreeder::Customer.new("Robert") }
  let(:breeder) { PuppyBreeder::Breeder.new("Puppymaster")}
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

  describe "#add_breeder" do
    it "should update the breeder table with the name of the breeder" do
      result = PuppyBreeder.breeder_repo.add_breeder(breeder)
      expect(result.entries[0]["id"]).to eq('1')
      expect(result.entries[0]["name"]).to eq('Puppymaster')
    end #done
  end

  describe "#view_completed" do
    it "should show the purchase requests that are completed" do
      PuppyBreeder.customer_repo.add_customer(customer)
      PuppyBreeder.breeder_repo.add_breeder(breeder)
      breed1
      PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
      PuppyBreeder.purchase_repo.add_purchase_request(['collie'], customer)
      PuppyBreeder.purchase_repo.complete_request(['collie'], customer)
      result = PuppyBreeder.breeder_repo.view_completed
      expect(result.entries[0]["id"]).to eq('1')
      # expect(result.entries[0]["breed_id"]).to eq('1')
      expect(result.entries[0]["customer_id"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('completed')
    end #done

    it "should show no purchase requests if none are completed" do
      PuppyBreeder.customer_repo.add_customer(customer)
      PuppyBreeder.breeder_repo.add_breeder(breeder)
      breed1
      PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
      PuppyBreeder.purchase_repo.add_purchase_request(['collie'], customer)
      PuppyBreeder.purchase_repo.deny_request(['collie'], customer)
      result = PuppyBreeder.breeder_repo.view_completed
      expect(result.entries).to eq([])
    end #done

  end
  
end