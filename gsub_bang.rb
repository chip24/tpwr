text = "hello, world"
text.gsub(/[aeiou]/, "")
puts text

text.gsub!(/[aeiou]/, "")
puts text