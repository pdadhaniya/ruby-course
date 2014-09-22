require_relative '../spec_helper.rb'

describe Songify::Song do 
  let(:song1) { Songify::Song.new("Happy Birthday", "Rap", ["Drake"])}

  describe "#initialize" do
    it "should make a new song" do
      expect(song1.title).to eq("Happy Birthday")
      expect(song1.genre).to eq("Rap")
      expect(song1.artist).to eq(["Drake"])
    end

    it "should make a new song with multiple artists if an array of artists is the argument" do
      song2 = Songify::Song.new("Hey", "Classical", ["Drake", "Jay-Z"])
      expect(song2.title).to eq("Hey")
      expect(song2.genre).to eq("Classical")
      expect(song2.artist).to eq(["Drake", "Jay-Z"])
    end
  end

end