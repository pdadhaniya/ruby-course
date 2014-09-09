#Refer to this class as Songify::Song
module Songify
  class Song
  attr_reader :name, :artist

    def initialize(name)
      @name = name
      @id = nil
    end


  end
end