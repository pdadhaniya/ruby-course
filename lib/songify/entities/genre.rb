#Refer to this class as Songify::Genre
module Songify
  class Genre
    attr_reader :type
    attr_accessor :id

    def initialize(type, id=nil)
      @type = type
      @id = id
    end

  end
end