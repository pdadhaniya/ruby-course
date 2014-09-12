require_relative '../spec_helper.rb'

describe Songify::Song do 
  let(:song1) { Songify::Song.new("Happy Birthday", "Rap")}

  describe "#initialize" do
    it "should make a new song" do
      expect(song1.title).to eq("Happy Birthday")
      expect(song1.genre).to eq("Rap")
    end
  end





  
end