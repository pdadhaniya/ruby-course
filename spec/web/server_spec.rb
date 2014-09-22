require 'server_spec_helper'

describe Songify::Server do
  let(:genre1) { Songify::Genre.new("Rap") }
  let(:genre2) { Songify::Genre.new("Classical")}
  let(:artist1) { Songify::Artist.new("Drake")}
  let(:artist2) { Songify::Artist.new("Eagles")}

  before(:each) do
    Songify.drop_tables
    Songify.create_tables
  end

  def app
    Songify::Server.new
  end

  describe "GET /songs" do
    it "loads the songs homepage" do
      Songify.genres_repo.save_genre(genre1)
      Songify.genres_repo.save_genre(genre2)
      Songify.artists_repo.save_artist(artist1)
      Songify.artists_repo.save_artist(artist2)
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday", "Rap", ["Drake"]))
      Songify.songs_repo.save_song(Songify::Song.new("Hotel California", "Classical", ["Eagles"]))

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
    it "should show the title and genre of the song who's id was searched for" do
      Songify.genres_repo.save_genre(genre1)
      Songify.genres_repo.save_genre(genre2)
      Songify.artists_repo.save_artist(artist1)
      Songify.artists_repo.save_artist(artist2)
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday", "Rap", ["Drake"]))
      Songify.songs_repo.save_song(Songify::Song.new("Hotel California", "Classical", ["Eagles"]))

      get '/songs/2'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Hotel California", "Classical"
    end
  end

  describe 'POST /songs' do
    it "should save the inputted song into the songs database and redirect to that songs page" do
      Songify.genres_repo.save_genre(genre1)
      Songify.genres_repo.save_genre(genre2)
      Songify.artists_repo.save_artist(artist1)
      Songify.artists_repo.save_artist(artist2)      
      post '/songs', { "song-title" => "Stairway to Heaven", "genre-type" => "Rap", "artist-name" => ["Drake"]}
      expect(last_response.status).to eq(302)
      last_song = Songify.songs_repo.get_all_songs.last
      expect(last_song["title"]).to eq("Stairway to Heaven")
    end
  end

  describe 'GET /songs/:id/edit' do
    it "should show the form to edit a song based on the id put in the link" do
      Songify.genres_repo.save_genre(genre1)
      Songify.artists_repo.save_artist(artist1)
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday", "Rap", ["Drake"]))
      get '/songs/1/edit'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Title:", "Genre"
    end
  end

  describe 'DELETE /songs/' do
    it "should remove the song from the database" do
      Songify.genres_repo.save_genre(genre1)
      Songify.artists_repo.save_artist(artist1) 
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday", "Rap", ["Drake"]))

      delete '/songs/1', { "song-title" => "Happy Birthday"}
      expect(last_response).to be_redirect
    end
  end

  describe 'PUT /songs/:id' do
    it "should update the song title in the database and redirect to the page" do
      Songify.genres_repo.save_genre(genre1)
      Songify.artists_repo.save_artist(artist1)
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday", "Rap", ["Drake"]))

      put '/songs/1', { "song-title" => "Parag Dadhaniya", "genre-type" => "Rap", "artist-name" => ["Drake"] }
      expect(last_response.status).to eq(302)
      last_song = Songify.songs_repo.get_all_songs.last
      expect(last_song["title"]).to eq("Parag Dadhaniya")
    end
  end

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
    it "should show the form to save a new genre" do
      get '/genres/new'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Type:"
    end
  end

  describe 'GET /genres/:id' do
    it "should show the type of the genre who's id was searched for" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))
      Songify.genres_repo.save_genre(Songify::Genre.new("Classical"))

      get '/genres/2'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Classical"
    end
  end

  describe 'POST /genres' do
    it "should save the inputted genre into the genres database and redirect to that genres page" do
      
      post '/genres', { "genre-type" => "Hip-Hop"}
      expect(last_response.status).to eq(302)
      last_genre = Songify.genres_repo.get_all_genres.last
      expect(last_genre["type"]).to eq("Hip-Hop")
    end
  end

  describe 'GET /genres/:id/edit' do
    it "should show the form to edit a genre based on the id put in the link" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))

      get '/genres/1/edit'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Type:"
    end
  end

  describe 'DELETE /genres/' do
    it "should remove the genre from the database" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))

      delete '/genres/1', { "genre-type" => "Rap"}
      expect(last_response).to be_redirect
    end
  end
  
  describe 'PUT /genres/:id' do
    it "should update the genre type in the database and redirect to the page" do
      Songify.genres_repo.save_genre(Songify::Genre.new("Rap"))

      put '/genres/1', { "genre-type" => "Classical" }
      expect(last_response.status).to eq(302)
      last_genre = Songify.genres_repo.get_all_genres.last
      expect(last_genre["type"]).to eq("Classical")
    end
  end

  describe "GET /artists" do
    it "loads the artists homepage" do
      Songify.artists_repo.save_artist(Songify::Artist.new("Drake"))
      Songify.artists_repo.save_artist(Songify::Artist.new("Jon"))

      get '/artists'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Drake", "Jon"
    end
  end

  describe 'GET /artists/new' do
    it "should show the form to save a new artist" do
      get '/artists/new'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Name:"
    end
  end

  describe 'GET /artists/:id' do
    it "should show the name of the artist who's id was searched for" do
      Songify.artists_repo.save_artist(Songify::Artist.new("U2"))
      Songify.artists_repo.save_artist(Songify::Artist.new("Drake"))

      get '/artists/2'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Drake"
    end
  end

  describe 'POST /artists' do
    it "should save the inputted artist into the artists database and redirect to that artists page" do
      
      post '/artists', { "artist-name" => "Drake"}
      expect(last_response.status).to eq(302)
      last_artist = Songify.artists_repo.get_all_artists.last
      expect(last_artist["name"]).to eq("Drake")
    end
  end

  describe 'GET /artists/:id/edit' do
    it "should show the form to edit an artist based on the id put in the link" do
      Songify.artists_repo.save_artist(Songify::Artist.new("U2"))

      get '/artists/1/edit'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Name:"
    end
  end

  describe 'DELETE /artists/' do
    it "should remove the artist from the database" do
      Songify.artists_repo.save_artist(Songify::Artist.new("DMX"))

      delete '/artists/1', { "artist-name" => "DMX"}
      expect(last_response).to be_redirect
    end
  end

  describe 'PUT /artists/:id' do
    it "should update the artist type in the database and redirect to the page" do
      Songify.artists_repo.save_artist(Songify::Artist.new("U2"))

      put '/artists/1', { "artist-name" => "MGK" }
      expect(last_response.status).to eq(302)
      last_artist = Songify.artists_repo.get_all_artists.last
      expect(last_artist["name"]).to eq("MGK")
    end
  end


end