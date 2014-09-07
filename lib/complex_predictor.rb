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

    @top_words = Hash.new
    @sorted_words = Hash.new
    @category_word_count.each do |category, words_count|
      @sorted_words[category] = (@category_word_count[category]).sort {|a, b| b[1]<=>a[1]}
    end
    
    @sorted_words.each do |category, words_count|
      @top_words[category] = {}
    end

    @top_words.each do |category, words_hash|
      p = 0
      while p < 10
        @top_words[category][@sorted_words[category][p][0]] = @sorted_words[category][p][1]
        p += 1
      end
    end

    # @top_fifty_astronomy = Hash.new(0)
    # @sorted_words_astronomy = (@category_word_count[:astronomy]).sort { |a, b| b[1]<=>a[1]}
    # a = 0
    # while a < 100
    #   @top_fifty_astronomy[@sorted_words_astronomy[a][0]] = @sorted_words_astronomy[a][1]
    #   a += 1
    # end

    # @top_fifty_philosophy = Hash.new(0)
    # @sorted_words_philosophy = (@category_word_count[:philosophy]).sort { |a, b| b[1]<=>a[1]}
    # b = 0
    # while b < 100
    #   @top_fifty_philosophy[@sorted_words_philosophy[b][0]] = @sorted_words_philosophy[b][1]
    #   b += 1
    # end

    # @top_fifty_archeology = Hash.new(0)
    # @sorted_words_archeology = (@category_word_count[:archeology]).sort { |a, b| b[1]<=>a[1]}
    # c = 0
    # while c < 100
    #   @top_fifty_archeology[@sorted_words_archeology[c][0]] = @sorted_words_archeology[c][1]
    #   c += 1
    # end

    # @top_fifty_religion = Hash.new(0)
    # @sorted_words_religion = (@category_word_count[:religion]).sort { |a, b| b[1]<=>a[1]}
    # d = 0
    # while d < 100
    #   @top_fifty_religion[@sorted_words_religion[d][0]] = @sorted_words_religion[d][1]
    #   d += 1
    # end

    # @top_fifty = {:astronomy => @top_fifty_astronomy, :philosophy => @top_fifty_philosophy, :archeology => @top_fifty_archeology, :religion => @top_fifty_religion}

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
    # @astronomy_count = 0
    # @archeology_count = 0
    # @philosophy_count = 0
    # @religion_count = 0

    @pop_word = Hash.new(0)
    @top_words.each do |category, word_count|
      @pop_word[category] = 0
    end

    @pop_word.each do |category, count|
      q = 0
      while q < 100
        @pop_word[category] += 1 if (@top_words[category]).key?(@test_array[q])
        q += 1
      end
    end

    winner = @pop_word.max_by { |k, v| v }
    return winner[0]
    # @test_array.each do |x|

    #   @astronomy_count += 1 if (@top_words[:astronomy]).key?(x)
    #   @archeology_count += 1 if (@top_words[:archeology]).key?(x)
    #   @philosophy_count += 1 if (@top_words[:philosophy]).key?(x)
    #   @religion_count += 1 if (@top_words[:religion]).key?(x)
    # end
    # if @astronomy_count > @archeology_count && @astronomy_count > @philosophy_count && @astronomy_count > @religion_count
    #   :astronomy
    # elsif @archeology_count > @philosophy_count && @archeology_count > @religion_count
    #   :archeology
    # elsif @philosophy_count > @religion_count
    #   :philosophy
    # else
    #   :religion
    # end
    # :astronomy
  end
end

