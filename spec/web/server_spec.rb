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

  describe "GET /songs" do
    it "loads the homepage" do
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











end