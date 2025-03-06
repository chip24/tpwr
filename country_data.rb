# look aheads and leak behinds are zero-width assertions, which means that they check that a pattern exists at a certain position in a string without consuming(capturing?) any characters from the string

file = File.open("country_data.txt")

contents = file.read
puts contents

countries = contents.scan(/^[a-zA-Z ]+(?=:)/)
p countries 