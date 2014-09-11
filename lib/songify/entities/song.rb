#Refer to this class as Songify::Song
module Songify
  class Song
  attr_reader :title
  attr_accessor :id

    def initialize(title, id=nil)
      @title = title
      @id = id
    end


  end
end