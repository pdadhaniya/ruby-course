require_relative '../lib/songify.rb'
require 'sinatra/base'
require 'pry-byebug'

class Songify::Server < Sinatra::Application
set :bind, '0.0.0.0'

  get '/songs' do
    @songs = Songify.songs_repo.get_all_songs
    erb :index
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
