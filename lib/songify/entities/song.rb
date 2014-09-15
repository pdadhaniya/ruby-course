#Refer to this class as Songify::Song
module Songify
  class Song
  attr_reader :title
  attr_accessor :id, :artist
  attr_accessor :genre

    def initialize(title, genre, artist, id=nil)
      @title = title
      @genre = genre
      @artist = artist
      @id = id
    end


  end
end