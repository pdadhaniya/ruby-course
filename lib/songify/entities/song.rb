#Refer to this class as Songify::Song
module Songify
  class Song
  attr_reader :title
  attr_accessor :id
  attr_accessor :genre

    def initialize(title, genre, id=nil)
      @title = title
      @genre = genre
      @id = id
    end


  end
end