require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::PurchaseRequestRepo do
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
    breed1
  end

  describe "#add_purchase_request" do
    it "should update the purchase request table with customer_id, and status" do
      breed2
      PuppyBreeder.puppy_repo.add_puppy(bob, breeder)
      result = PuppyBreeder.purchase_repo.add_purchase_request(['pitbull'], customer)
      expect(result[-1]["id"]).to eq('1')
      # expect(result.entries[0]["breed_id"]).to eq('2')
      expect(result[-1]["customer_id"]).to eq('1')
      expect(result[-1]["status"]).to eq('pending')
    end #done
  end

  describe "#deny_request" do
    it "should change the status of a request to denied in the purchase request table" do
      PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
      PuppyBreeder.purchase_repo.add_purchase_request(['collie'], customer)
      result = PuppyBreeder.purchase_repo.deny_request(['collie'], customer)
      expect(result.entries[0]["id"]).to eq('1')
      # expect(result.entries[0]["breed_id"]).to eq('1')
      expect(result.entries[0]["customer_id"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('denied')
    end #done
  end

  describe "#complete_request" do
    it "should change the status of a request to completed in the purchase request table" do
      PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
      PuppyBreeder.purchase_repo.add_purchase_request(['collie'], customer)
      result = PuppyBreeder.purchase_repo.complete_request(['collie'], customer)
      expect(result.entries[0]["id"]).to eq('1')
      # expect(result.entries[0]["breed_id"]).to eq('1')
      expect(result.entries[0]["customer_id"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('completed')
    end #done
  end

  describe "#view_pending" do
    it "should show the purchase requests that are currently pending" do
      PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
      PuppyBreeder.purchase_repo.add_purchase_request(['collie'], customer)
      result = PuppyBreeder.purchase_repo.view_pending
      expect(result.entries[0]["id"]).to eq('1')
      # expect(result.entries[0]["breed_id"]).to eq('1')
      expect(result.entries[0]["customer_id"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('pending')
    end #done

    it "should show no purchase requests if none are currently pending" do
      PuppyBreeder.puppy_repo.add_puppy(fred, breeder)
      PuppyBreeder.purchase_repo.add_purchase_request(['collie'], customer)
      PuppyBreeder.purchase_repo.complete_request(['collie'], customer)
      result = PuppyBreeder.purchase_repo.view_pending
      expect(result.entries).to eq([])
    end #done

  end


















  
end