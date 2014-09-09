require_relative '../spec_helper.rb'

describe Songify::Song do 
  let(:song1) { Songify::Song.new("Happy Birthday")}

  describe "#initialize" do
    it "should make a new song" do
      expect(song1.name).to eq("Happy Birthday")
    end
  end





  
end