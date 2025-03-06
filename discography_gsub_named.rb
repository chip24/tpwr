file = File.new("discography.txt")

contents = file.read
puts contents

puts contents.gsub(
  /^(?<year>[0-9]{4}) - (?<album>.+)$/, '\k<album> \k<year>'
)

# on 2-14 start on page 136 in Replacement Blocks