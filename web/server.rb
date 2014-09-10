require_relative '../lib/songify.rb'
require 'sinatra/base'
# require 'rubygems'


class Songify::Server < Sinatra::Application
set :bind, '0.0.0.0'

  get '/' do
    @songs = Songify.songs_repo.get_all_songs
    erb :index
  end






run! if app_file == $0 #what does this mean?!?!


end

