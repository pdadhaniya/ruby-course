#Refer to this class as Songify::Artist
module Songify
  class Artist
    attr_accessor :name, :id

    def initialize(name, id=nil)
      @name = name
      @id = id
    end

  end
end