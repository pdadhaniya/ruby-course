require_relative '../spec_helper.rb'

describe Songify::Repositories::SongsRepo do 
  let(:song1) { Songify::Song.new("Happy Birthday")}

  before(:each) do
    Songify.songs_repo.drop_tables
    Songify.songs_repo.create_tables
  end

  describe "#save_song" do
    it "should save a song to the songs table" do
      result = Songify.songs_repo.save_song(song1)
      expect(result["name"]).to eq("Happy Birthday")
      expect(result["id"]).to eq("1")
      expect(song1.id).to eq(1)
    end
  end

  describe "#delete_song" do
    it "should remove a song from the songs table" do
      Songify.songs_repo.save_song(song1)
      result = Songify.songs_repo.delete_song(song1)
      binding.pry
      expect(result.entries).to eq([])
    end
  end






  
end