#Refer to this class as Songify::Song
module Songify
  class Song
  attr_reader :title
  attr_accessor :id

    def initialize(title)
      @title = title
      @id = nil
    end


  end
end