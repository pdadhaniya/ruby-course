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

  get '/songs/new' do
    erb :save
  end

  post '/songs' do
    song = Songify::Song.new(params["song-title"])
    Songify.songs_repo.save_song(song)
    redirect to("/songs/#{song.id}")
  end

  put '/songs/:id' do
    song = Songify::Song.new(params["song-title"], params["id"])
    # binding.pry
    Songify.songs_repo.save_song(song)
    redirect to ("/songs/#{song.id}")
  end

  delete '/songs/:id' do
    song = Songify::Song.new(params["song-title"], params["id"])
    Songify.songs_repo.delete_song(song)
    redirect to ("/songs")    
  end

  get '/songs/:id/edit' do
    @song_to_edit = Songify.songs_repo.get_song(params[:id])
    erb :edit
  end

  get '/songs/:id' do
    @song = Songify.songs_repo.get_song(params[:id])
    erb :result
  end

run! if app_file == $0 #what does this mean?!?!

end
