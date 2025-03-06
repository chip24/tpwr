file = File.new("discography.txt")

contents = file.read
puts contents

p contents.scan(/^([0-9]{4}) - (.+)$/)