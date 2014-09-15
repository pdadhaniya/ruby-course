require_relative '../lib/songify.rb'
require 'sinatra/base'
require 'pry-byebug'

class Songify::Server < Sinatra::Application
set :bind, '0.0.0.0'

  get '/songs' do
    @songs = Songify.songs_repo.get_all_songs
    erb :index
  end

  get '/genres' do
    @genres = Songify.genres_repo.get_all_genres
    erb :genre_index
  end

  get '/artists' do
    @artists = Songify.artists_repo.get_all_artists
    erb :artist_index
  end

  get '/songs/new' do
    @genres = Songify.genres_repo.all_genres
    erb :save
  end

  get '/genres/new' do
    erb :save_genre
  end

  get '/artists/new' do
    erb :save_artist
  end

  post '/songs' do
    song = Songify::Song.new(params["song-title"], params["genre-type"], params["artist-name"])
    Songify.songs_repo.save_song(song)
    redirect to("/songs/#{song.id}")
  end

  post '/genres' do
    genre = Songify::Genre.new(params["genre-type"])
    Songify.genres_repo.save_genre(genre)
    redirect to("/genres/#{genre.id}")
  end

  post '/artists' do
    artist = Songify::Artist.new(params["artist-name"])
    Songify.artists_repo.save_artist(artist)
    redirect to("/artists/#{artist.id}")
  end

  put '/songs/:id' do
    song = Songify::Song.new(params["song-title"], params["genre-type"], params["artist-name"], params["id"])
    # binding.pry
    Songify.songs_repo.save_song(song)
    redirect to ("/songs/#{song.id}")
  end

  put '/genres/:id' do
    genre = Songify::Genre.new(params["genre-type"], params["id"])
    Songify.genres_repo.save_genre(genre)
    redirect to ("/genres/#{genre.id}")
  end

  delete '/songs/:id' do
    song = Songify::Song.new(params["song-title"], params["genre-type"], params["artist-name"], params["id"])
    Songify.songs_repo.delete_song(song)
    redirect to ("/songs")    
  end

  delete '/genres/:id' do
    genre = Songify::Genre.new(params["genre-type"], params["id"])
    Songify.genres_repo.delete_genre(genre)
    redirect to ("/genres")
  end

  get '/songs/:id/edit' do
    @genres = Songify.genres_repo.all_genres
    @song_to_edit = Songify.songs_repo.get_song(params[:id])
    erb :edit
  end

  get '/genres/:id/edit' do
    @genre_to_edit = Songify.genres_repo.get_genre(params[:id])
    erb :edit_genre
  end

  get '/songs/:id' do
    @song = Songify.songs_repo.get_song(params[:id])
    erb :result
  end

  get '/genres/:id' do
    @genre = Songify.genres_repo.get_genre(params[:id])
    erb :result_genre
  end

  get '/artists/:id' do
    @artist = Songify.artists_repo.get_artist(params[:id])
    erb :result_artist
  end

run! if app_file == $0 #what does this mean?!?!

end
