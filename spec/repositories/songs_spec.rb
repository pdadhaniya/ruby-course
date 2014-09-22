require_relative '../spec_helper.rb'

describe Songify::Repositories::SongsRepo do 
  let(:genre1) { Songify::Genre.new("Rap")}
  let(:song1) { Songify::Song.new("Happy Birthday", "Rap", ["Drake"])}
  let(:artist1) { Songify::Artist.new("Drake")}

  before(:each) do
    Songify.drop_tables
    Songify.create_tables
    Songify.genres_repo.save_genre(genre1)
    Songify.artists_repo.save_artist(artist1)
  end

  describe "#save_song" do
    it "should save a song to the songs table" do
      result = Songify.songs_repo.save_song(song1)
      expect(result["title"]).to eq("Happy Birthday")
      expect(result["genre"]).to eq("1")
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

  describe "get_song_id" do
    it "should return the id of the song requested" do
      Songify.songs_repo.save_song(song1)
      result = Songify.songs_repo.get_song_id("Happy Birthday")
      expect(result).to eq(1)
    end
  end

  describe "#get_song" do
    it "should return the requested song" do
      Songify.songs_repo.save_song(song1)
      result = Songify.songs_repo.get_song(1)
      expect(result["title"]).to eq("Happy Birthday")
      expect(result["id"]).to eq("1")
      expect(result["genre"]).to eq("1")
    end
  end

  describe "#get_all_songs" do
    it "should return all songs in the songs table" do
      artist2 = Songify::Artist.new("Eagles")
      Songify.artists_repo.save_artist(artist2)
      genre2 = Songify::Genre.new("Classical")
      Songify.genres_repo.save_genre(genre2)
      song2 = Songify::Song.new("Hotel California", "Classical", ["Eagles"])
      Songify.songs_repo.save_song(song1)
      Songify.songs_repo.save_song(song2)
      result = Songify.songs_repo.get_all_songs
      expect(result[0]["id"]).to eq("1")
      expect(result[0]["title"]).to eq("Happy Birthday")
      expect(result[0]["genre"]).to eq("1")
      expect(result[1]["id"]).to eq("2")
      expect(result[1]["title"]).to eq("Hotel California")
      expect(result[1]["genre"]).to eq("2")
    end
  end
  
end