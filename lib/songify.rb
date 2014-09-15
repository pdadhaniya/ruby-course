require 'pg'

module Songify

  def self.songs_repo=(z)
    @songs_repo = z
  end

  def self.songs_repo
    @songs_repo
  end

  def self.genres_repo=(y)
    @genres_repo = y
  end

  def self.genres_repo
    @genres_repo
  end

  def self.artists_repo=(x)
    @artists_repo = x
  end

  def self.artists_repo
    @artists_repo
  end

end


require_relative 'songify/entities/song.rb'
require_relative 'songify/entities/genre.rb'
require_relative 'songify/entities/artist.rb'
require_relative 'songify/repositories/songs.rb'
require_relative 'songify/repositories/genres.rb'
require_relative 'songify/repositories/artists.rb'

Songify.songs_repo = Songify::Repositories::SongsRepo.new
Songify.genres_repo = Songify::Repositories::GenresRepo.new
Songify.artists_repo = Songify::Repositories::ArtistsRepo.new