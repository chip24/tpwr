file = File.open("discography.txt")

contents = file.read

puts contents.gsub(/^([0-9]{4}) - (.+)$/, '\2 (\1)')