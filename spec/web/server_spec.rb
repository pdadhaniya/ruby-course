require 'server_spec_helper'

describe Songify::Server do

  before(:each) do
    Songify.songs_repo.drop_tables
    Songify.genres_repo.drop_tables
    Songify.genres_repo.create_tables
    Songify.songs_repo.create_tables
  end

  def app
    Songify::Server.new
  end

  #SONGS
  describe "GET /songs" do
    it "loads the songs homepage" do
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday"))
      Songify.songs_repo.save_song(Songify::Song.new("Hotel California"))

      get '/songs'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Happy Birthday", "Hotel California"
    end
  end

  describe 'GET /songs/new' do
    it "should show the form to save a new song" do
      get '/songs/new'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Title:"
    end
  end

  describe 'GET /songs/:id' do
    it "should show the title of the song who's id was searched for" do
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday"))
      Songify.songs_repo.save_song(Songify::Song.new("Hotel California"))

      get '/songs/2'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Hotel California"
    end
  end

  describe 'POST /songs' do
    it "should save the inputted song into the songs database and redirect to that songs page" do
      
      post '/songs', { "song-title" => "Stairway to Heaven"}
      expect(last_response.status).to eq(302)
      last_song = Songify.songs_repo.get_all_songs.last
      expect(last_song["title"]).to eq("Stairway to Heaven")
    end
  end

  describe 'GET /songs/:id/edit' do
    it "should show the form to edit a song based on the id put in the link" do
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday"))

      get '/songs/1/edit'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Title:"
    end
  end

  describe 'PUT /songs/:id' do
    it "should update the song title in the database and redirect to the page" do
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday"))

      put '/songs/1', { "song-title" => "Parag Dadhaniya" }
      expect(last_response.status).to eq(302)
      last_song = Songify.songs_repo.get_all_songs.last
      expect(last_song["title"]).to eq("Parag Dadhaniya")
    end
  end

  describe 'DELETE /songs/' do
    it "should remove the song from the database" do
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday"))

      delete '/songs/1', { "song-title" => "Happy Birthday"}
      expect(last_response).to be_redirect
    end
  end

  #GENRES
  describe "GET /genres" do
    it "loads the genres homepage" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))
      Songify.genres_repo.save_genre(Songify::Genre.new("Classical"))

      get '/genres'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Rap", "Classical"
    end
  end

  describe 'GET /genres/new' do
    xit "should show the form to save a new genre" do
      get '/genres/new'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Title:"
    end
  end

  describe 'GET /genres/:id' do
    xit "should show the type of the genre who's id was searched for" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))
      Songify.genres_repo.save_genre(Songify::Genre.new("Classical"))

      get '/genres/2'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Classical"
    end
  end

  describe 'POST /genres' do
    xit "should save the inputted genre into the genres database and redirect to that genres page" do
      
      post '/genres', { "genre-type" => "Hip-Hop"}
      expect(last_response.status).to eq(302)
      last_genre = Songify.genres_repo.get_all_genres.last
      expect(last_genre["type"]).to eq("Hip-Hop")
    end
  end

  describe 'GET /genres/:id/edit' do
    xit "should show the form to edit a genre based on the id put in the link" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))

      get '/genres/1/edit'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Title:"
    end
  end

  describe 'PUT /genres/:id' do
    xit "should update the genre type in the database and redirect to the page" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))

      put '/genres/1', { "genre-type" => "Classical" }
      expect(last_response.status).to eq(302)
      last_genre = Songify.genres_repo.get_all_genres.last
      expect(last_genre["type"]).to eq("Classical")
    end
  end

  describe 'DELETE /genres/' do
    xit "should remove the genre from the database" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))

      delete '/genres/1', { "genre-type" => "Rap"}
      expect(last_response).to be_redirect
    end
  end





end