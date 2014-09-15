require_relative '../spec_helper.rb'

describe Songify::Repositories::SongsArtistsRepo do


  before(:each) do
    Songify.songs_artists_repo.drop_tables
    Songify.songs_repo.drop_tables
    Songify.genres_repo.drop_tables
    Songify.artists_repo.drop_tables
    Songify.artists_repo.create_tables
    Songify.genres_repo.create_tables
    Songify.songs_repo.create_tables
    Songify.songs_artists_repo.create_tables
  end


  describe "#view_songs_artists" do
    it "should display all records for the songs artists table" do
      artist1 = Songify::Artist.new("U2")
      artist2 = Songify::Artist.new("Drake")
      Songify.artists_repo.save_artist(artist1)
      Songify.artists_repo.save_artist(artist2)
      genre1 = Songify::Genre.new("Rap")
      Songify.genres_repo.save_genre(genre1)      
      song1 = Songify::Song.new("Song of Parag", "Rap", ["U2", "Drake"])
      Songify.songs_repo.save_song(song1)
      result = Songify.songs_artists_repo.view_songs_artists
      expect(result[0]["song_id"]).to eq("1")
      expect(result[0]["artist_id"]).to eq("1")
      expect(result[1]["song_id"]).to eq("1")
      expect(result[1]["artist_id"]).to eq("2")
    end
  end












end