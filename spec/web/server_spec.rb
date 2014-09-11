require 'server_spec_helper'

describe Songify::Server do

  before(:each) do
    Songify.songs_repo.drop_tables
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



end