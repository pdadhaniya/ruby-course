
module Songify

  def self.songs_repo=(z)
    @songs_repo = z
  end

  def self.songs_repo
    @songs_repo
  end

end


require_relative 'songify/entities/song.rb'
require_relative 'songify/repositories/songs.rb'

Songify.songs_repo = Songify::Repositories::SongsRepo.new