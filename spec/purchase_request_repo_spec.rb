require_relative 'spec_helper.rb'

describe PuppyBreeder::Repositories::PurchaseRequestRepo do
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

  describe "#add_purchase_request" do
    it "should update the purchase request table with puppy, customer, and status" do
      PuppyBreeder.puppy_repo.add_puppy(fred)
      PuppyBreeder.customer_repo.add_customer(customer)
      result = PuppyBreeder.purchase_repo.add_purchase_request(fred, customer)
      expect(result.entries[0]["id"]).to eq('1')
      expect(result.entries[0]["puppy"]).to eq('1')
      expect(result.entries[0]["customer"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('pending')
    end
  end

  describe "#deny_request" do
    it "should change the status of a request to denied in the purchase request table" do
      PuppyBreeder.puppy_repo.add_puppy(fred)
      PuppyBreeder.customer_repo.add_customer(customer)
      PuppyBreeder.purchase_repo.add_purchase_request(fred, customer)
      result = PuppyBreeder.purchase_repo.deny_request(fred, customer)
      expect(result.entries[0]["id"]).to eq('1')
      expect(result.entries[0]["puppy"]).to eq('1')
      expect(result.entries[0]["customer"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('denied')
    end
  end

  describe "#complete_request" do
    it "should change the status of a request to completed in the purchase request table" do
      PuppyBreeder.puppy_repo.add_puppy(fred)
      PuppyBreeder.customer_repo.add_customer(customer)
      PuppyBreeder.purchase_repo.add_purchase_request(fred, customer)
      result = PuppyBreeder.purchase_repo.complete_request(fred, customer)
      expect(result.entries[0]["id"]).to eq('1')
      expect(result.entries[0]["puppy"]).to eq('1')
      expect(result.entries[0]["customer"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('completed')
    end
  end

  describe "#view_pending" do
    it "should show the purchase requests that are currently pending" do
      PuppyBreeder.puppy_repo.add_puppy(fred)
      PuppyBreeder.customer_repo.add_customer(customer)
      PuppyBreeder.purchase_repo.add_purchase_request(fred, customer)
      result = PuppyBreeder.purchase_repo.view_pending
      expect(result.entries[0]["id"]).to eq('1')
      expect(result.entries[0]["puppy"]).to eq('1')
      expect(result.entries[0]["customer"]).to eq('1')
      expect(result.entries[0]["status"]).to eq('pending')
    end
    it "should show no purchase requests if none are currently pending" do
      PuppyBreeder.puppy_repo.add_puppy(fred)
      PuppyBreeder.customer_repo.add_customer(customer)
      PuppyBreeder.purchase_repo.add_purchase_request(fred, customer)
      PuppyBreeder.purchase_repo.complete_request(fred, customer)
      result = PuppyBreeder.purchase_repo.view_pending
      expect(result.entries).to eq([])
    end

  end


















  
end