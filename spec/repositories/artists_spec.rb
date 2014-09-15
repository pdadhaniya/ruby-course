require_relative '../spec_helper.rb'

describe Songify::Repositories::ArtistsRepo do
  let(:artist1) { Songify::Artist.new("U2") }

  before(:each) do
    Songify.songs_repo.drop_tables
    Songify.genres_repo.drop_tables
    Songify.artists_repo.drop_tables
    Songify.artists_repo.create_tables
    Songify.genres_repo.create_tables
    Songify.songs_repo.create_tables
  end

  describe "#save_artist" do
    it "should save a artist to the artists table" do
      result = Songify.artists_repo.save_artist(artist1)
      expect(result["name"]).to eq("U2")
      expect(result["id"]).to eq("1")
      expect(artist1.id).to eq(1)
    end

    it "should update a artist in artists table if that artist id exists" do
      Songify.artists_repo.save_artist(artist1)
      artist1.name = "Drake"
      result = Songify.artists_repo.save_artist(artist1)
      expect(result["name"]).to eq("Drake")
      expect(result["id"]).to eq("1")
    end
  end

  describe "get_artist_id" do
    it "should return the id of the artist requested" do
      Songify.artists_repo.save_artist(artist1)
      result = Songify.artists_repo.get_artist_id("U2")
      expect(result).to eq(1)
    end
  end

  describe "#delete_artist" do
    it "should remove a artist from the artist table" do
      Songify.artists_repo.save_artist(artist1)
      result = Songify.artists_repo.delete_artist(artist1)
      expect(result.entries).to eq([])
    end
  end

  describe "#get_artist" do
    it "should return the requested artist" do
      Songify.artists_repo.save_artist(artist1)
      result = Songify.artists_repo.get_artist(1)
      expect(result["name"]).to eq("U2")
      expect(result["id"]).to eq("1")
    end
  end

  describe "#get_all_artists" do
    it "should return all artists in the artists table" do
      artist2 = Songify::Artist.new("Drake")
      Songify.artists_repo.save_artist(artist1)
      Songify.artists_repo.save_artist(artist2)
      result = Songify.artists_repo.get_all_artists
      expect(result[0]["name"]).to eq("U2")
      expect(result[1]["name"]).to eq("Drake")
    end
  end


end