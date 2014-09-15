#Refer to this class as Songify::Artist
module Songify
  class Artist
    attr_accessor :name
    attr_accessor :id

    def initialize(name, id=nil)
      @name = name
      @id = id
    end

  end
end