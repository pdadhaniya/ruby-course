require_relative '../spec_helper.rb'

describe Songify::Repositories::GenresRepo do
  let(:genre1) { Songify::Genre.new("Rap") }

  before(:each) do
    Songify.songs_repo.drop_tables
    Songify.genres_repo.drop_tables
    Songify.genres_repo.create_tables
    Songify.songs_repo.create_tables
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



  describe "#delete_genre" do
    xit "should remove a genre from the genres table" do

    end
  end

  describe "#get_genre" do
    xit "should return the requested genre" do

    end
  end

  describe "#get_all_genres" do
    xit "should return all genres in the genres table" do

    end
  end





end