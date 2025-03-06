#My code was ranked 6th out of 94.  I only used Copilot to help me deal with the periods sometimes used in the query for the search method to represent any character.

class WordDictionary
  attr_accessor :word_arr

  def initialize()
    @word_arr = []
  end

  def add_word(word)
    @word_arr << word
  end

  def search(word)
    regex = Regexp.new('^' + word.gsub('.', '.') + '$')
    @word_arr.any? { |word| regex.match?(word) }
  end
end

# Example usage
dictionary = WordDictionary.new
dictionary.add_word("up")
puts dictionary.search(".p") # Output: true
