require_relative '../spec_helper.rb'

describe Songify::Song do 
  let(:song1) { Songify::Song.new("The Prayer", "Kid Cudi")}

  describe "#initialize" do
    it "should make a new song" do
      expect(song1.name).to eq("The Prayer")
      expect(song1.artist).to eq("Kid Cudi")
    end
  end





  
end