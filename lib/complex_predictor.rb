require_relative 'predictor'
require 'pry'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    # @data looks like:
    #
    # {
    #   philosophy: {
    #     words: 1000,
    #     books: 10,
    #   },
    #   archeology: {
    #     words: 2000,
    #     books: 5,
    #   }
    # }

    @data = Hash.new(0)
    # @all_books.each do |category, books|
    #   @data[category] = {
    #     words: 0,
    #     books: 0
    #   }
    #   books.each do |filename, tokens|
    #     @data[category][:words] += tokens.count
    #     @data[category][:books] += 1
    #   end
    # end 
    @category_word_count = {}
    @total = 0
    @all_books.each do |category, books|
      @category_word_count[category] = Hash.new(0)
      books.each do |filename, tokens|
        tokens.each do |x|
          @total += 1 if good_token?(x)
          @category_word_count[category][x] += 1 if good_token?(x)
        end
      end
    end
    @top_fifty_astronomy = Hash.new(0)
    @sorted_words_astronomy = (@category_word_count[:astronomy]).sort { |a, b| b[1]<=>a[1]}
    a = 0
    while a < 100
      @top_fifty_astronomy[@sorted_words_astronomy[a][0]] = @sorted_words_astronomy[a][1]
      a += 1
    end
    # @astronomy_array = []
    # @top_fifty_astronomy.each do |word, count|
    #   @astronomy_array << word
    # end
    @top_fifty_philosophy = Hash.new(0)
    @sorted_words_philosophy = (@category_word_count[:philosophy]).sort { |a, b| b[1]<=>a[1]}
    b = 0
    while b < 100
      @top_fifty_philosophy[@sorted_words_philosophy[b][0]] = @sorted_words_philosophy[b][1]
      b += 1
    end
    # @philosophy_array = []
    # @top_fifty_philosophy.each do |word, count|
    #   @philosophy_array << word
    # end
    @top_fifty_archeology = Hash.new(0)
    @sorted_words_archeology = (@category_word_count[:archeology]).sort { |a, b| b[1]<=>a[1]}
    c = 0
    while c < 100
      @top_fifty_archeology[@sorted_words_archeology[c][0]] = @sorted_words_archeology[c][1]
      c += 1
    end
    # @archeology_array = []
    # @top_fifty_archeology.each do |word, count|
    #   @archeology_array << word
    # end
    @top_fifty_religion = Hash.new(0)
    @sorted_words_religion = (@category_word_count[:religion]).sort { |a, b| b[1]<=>a[1]}
    d = 0
    while d < 100
      @top_fifty_religion[@sorted_words_religion[d][0]] = @sorted_words_religion[d][1]
      d += 1
    end
    # @religion_array = []
    # @top_fifty_religion.each do |word, count|
    #   @religion_array << word
    # end
    @top_fifty = {:astronomy => @top_fifty_astronomy, :philosophy => @top_fifty_philosophy, :archeology => @top_fifty_archeology, :religion => @top_fifty_religion}

  end


  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    # Always predict astronomy, for now.
    @word_tally = Hash.new(0)
    tokens.each do |da_word| 
      @word_tally[da_word] += 1 if good_token?(da_word)
    end
    @sorted_word_tally = @word_tally.sort { |a, b| b[1]<=>a[1]}
    @test_top_fifty = Hash.new(0)
    e = 0
    while e < 100
      @test_top_fifty[@sorted_word_tally[e][0]] = @sorted_word_tally[e][1]
      e += 1
    end
    @test_array = []
    @test_top_fifty.each do |word, count|
      @test_array << word
    end
    @astronomy_count = 0
    @archeology_count = 0
    @philosophy_count = 0
    @religion_count = 0
    @test_array.each do |x|
      # @astronomy_count += 1 if @astronomy_array.include?(x)
      @astronomy_count += 1 if (@top_fifty[:astronomy]).key?(x)
      # @archeology_count += 1 if @archeology_array.include?(x)
      @archeology_count += 1 if (@top_fifty[:archeology]).key?(x)
      # @philosophy_count += 1 if @philosophy_array.include?(x)
      @philosophy_count += 1 if (@top_fifty[:philosophy]).key?(x)
      # @religion_count += 1 if @religion_array.include?(x)
      @religion_count += 1 if (@top_fifty[:religion]).key?(x)
    end
    if @astronomy_count > @archeology_count && @astronomy_count > @philosophy_count && @astronomy_count > @religion_count
      :astronomy
    elsif @archeology_count > @philosophy_count && @archeology_count > @religion_count
      :archeology
    elsif @philosophy_count > @religion_count
      :philosophy
    else
      :religion
    end
    # @top_twenty.each do |category, hash|
    #   hash.each do |word, count|
    #     counter = 0
    #     while counter < tokens.length
    #       if @sorted_word_tally[counter][0] == word
    #         counter = tokens.length
    #         return category
    #       else
    #         counter += 1
    #       end
    #     end
    #   end
    # end
    # :astronomy
  end
end

