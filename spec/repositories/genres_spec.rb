require_relative '../spec_helper.rb'

describe Songify::Repositories::GenresRepo do
  let(:genre1) { Songify::Genre.new("Rap") }

  before(:each) do
    Songify.drop_tables
    Songify.create_tables
  end

  describe "#save_genre" do
    it "should save a genre to the genres table" do
      result = Songify.genres_repo.save_genre(genre1)
      expect(result["type"]).to eq("Rap")
      expect(result["id"]).to eq("1")
      expect(genre1.id).to eq(1)
    end

    it "should update a genre in genres table if that genre id exists" do
      Songify.genres_repo.save_genre(genre1)
      genre1.type = "Classical"
      result = Songify.genres_repo.save_genre(genre1)
      expect(result["type"]).to eq("Classical")
      expect(result["id"]).to eq("1")
    end
  end

  describe "get_genre_id" do
    it "should return the id of the genre requested" do
      Songify.genres_repo.save_genre(genre1)
      result = Songify.genres_repo.get_genre_id("Rap")
      expect(result).to eq(1)
    end
  end

  describe "#delete_genre" do
    it "should remove a genre from the genres table" do
      Songify.genres_repo.save_genre(genre1)
      result = Songify.genres_repo.delete_genre(genre1)
      expect(result.entries).to eq([])
    end
  end

  describe "#get_genre" do
    it "should return the requested genre" do
      Songify.genres_repo.save_genre(genre1)
      result = Songify.genres_repo.get_genre(1)
      expect(result["type"]).to eq("Rap")
      expect(result["id"]).to eq("1")
    end
  end

  describe "#get_all_genres" do
    it "should return all genres in the genres table" do
      genre2 = Songify::Genre.new("Classical")
      Songify.genres_repo.save_genre(genre1)
      Songify.genres_repo.save_genre(genre2)
      result = Songify.genres_repo.get_all_genres
      expect(result[0]["type"]).to eq("Rap")
      expect(result[1]["type"]).to eq("Classical")
    end
  end

end