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

  def self.songs_artists_repo=(w)
    @songs_artists_repo = w
  end

  def self.songs_artists_repo
    @songs_artists_repo
  end

  def self.drop_tables
    Songify.songs_artists_repo.drop_tables
    Songify.songs_repo.drop_tables
    Songify.genres_repo.drop_tables
    Songify.artists_repo.drop_tables
  end

  def self.create_tables
    Songify.artists_repo.create_tables
    Songify.genres_repo.create_tables
    Songify.songs_repo.create_tables
    Songify.songs_artists_repo.create_tables
  end

end


require_relative 'songify/entities/song.rb'
require_relative 'songify/entities/genre.rb'
require_relative 'songify/entities/artist.rb'
require_relative 'songify/repositories/songs.rb'
require_relative 'songify/repositories/genres.rb'
require_relative 'songify/repositories/artists.rb'
require_relative 'songify/repositories/songs_artists.rb'

Songify.songs_repo = Songify::Repositories::SongsRepo.new
Songify.genres_repo = Songify::Repositories::GenresRepo.new
Songify.artists_repo = Songify::Repositories::ArtistsRepo.new
Songify.songs_artists_repo = Songify::Repositories::SongsArtistsRepo.new