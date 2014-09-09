#Refer to this class as Songify::Song
module Songify
  class Song
  attr_reader :name, :artist

    def initialize(name, artist)
      @name = name
      @artist = artist
    end


  end
end