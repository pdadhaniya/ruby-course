require_relative '../spec_helper.rb'

describe Songify::Repositories::GenresRepo do


  before(:each) do
    Songify.songs_repo.drop_tables
    Songify.genres_repo.drop_tables
    Songify.genres_repo.create_tables
    Songify.songs_repo.create_tables
  end

  describe "#save_genre" do
    xit "should save a genre to the genres table" do
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