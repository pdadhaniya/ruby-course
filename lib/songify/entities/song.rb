#Refer to this class as Songify::Song
module Songify
  class Song
  attr_reader :name
  attr_accessor :id

    def initialize(name)
      @name = name
      @id = nil
    end


  end
end