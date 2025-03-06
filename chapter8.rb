URL = /https?:\/\/\S+/
p URL.match("https://www.example.com")

text = "The British Broadcasting Corporation (BBC)"
p text.match(/bbc/i)

def letters
  puts "letters() called"
  sleep 1
  "A-Za-z"
end

words = %w[the quick brown fox jumped over the lazy dog]
words.each do |word| 
  puts "Matches!" if word.match(/\A[#{letters}]+\z/o)
end
