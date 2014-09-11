require_relative '../spec_helper.rb'

describe Songify::Repositories::SongsRepo do 
  let(:song1) { Songify::Song.new("Happy Birthday")}

  before(:each) do
    Songify.songs_repo.drop_tables
    Songify.genres_repo.drop_tables
    Songify.genres_repo.create_tables
    Songify.songs_repo.create_tables
  end

  describe "#save_song" do
    it "should save a song to the songs table" do
      result = Songify.songs_repo.save_song(song1)
      expect(result["title"]).to eq("Happy Birthday")
      expect(result["id"]).to eq("1")
      expect(song1.id).to eq(1)
    end
  end

  describe "#delete_song" do
    it "should remove a song from the songs table" do
      Songify.songs_repo.save_song(song1)
      result = Songify.songs_repo.delete_song(song1)
      expect(result.entries).to eq([])
    end
  end

  describe "#get_song" do
    it "should return the requested song" do
      Songify.songs_repo.save_song(song1)
      result = Songify.songs_repo.get_song(1)
      expect(result["title"]).to eq("Happy Birthday")
      expect(result["id"]).to eq("1")
    end
  end

  describe "#get_all_songs" do
    it "should return all songs in the songs table" do
      song2 = Songify::Song.new("Hotel California")
      Songify.songs_repo.save_song(song1)
      Songify.songs_repo.save_song(song2)
      result = Songify.songs_repo.get_all_songs
      # binding.pry
      expect(result[0]["id"]).to eq("1")
      expect(result[0]["title"]).to eq("Happy Birthday")
      expect(result[1]["id"]).to eq("2")
      expect(result[1]["title"]).to eq("Hotel California")
    end
  end





  
end