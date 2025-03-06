class WordDictionary

  attr_accessor :word_arr

  def initialize()
    @word_arr = []
  end

  def add_word(word)
    @word_arr << word
  end

  def search(word)
    @word_arr.include?(word)
  end

end

# on 2-6 find out why some tests aren't passing

wd = WordDictionary.new
wd.add_word('a')
wd.add_word('at')
wd.add_word('ate')
p wd.word_arr
p wd.search('ate')
p wd.search('ball')