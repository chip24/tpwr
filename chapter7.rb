

p "Hellø".reverse
puts "Hëlló Wôrld".encoding



string = "\xC5\x82"
puts string.length, string[0]
string = string.force_encoding("UTF-8")
puts string.length, string[0]

strng = "Hëllø wôrld\xFE\xFF"
p strng.scrub("").split

# on 2-11 start on page 113

