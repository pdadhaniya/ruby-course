require_relative '../spec_helper.rb'

describe Songify::Artist do 
  let(:artist1) { Songify::Artist.new("U2")}

  describe "#initialize" do
    it "should make a new artist" do
      expect(artist1.name).to eq("U2")
    end
  end





  
end