text = "A regular expression is a sequence of characters that define a search pattern."

puts "Found 'A' at the beginning of the string." if text.match(/^A/)
puts "Found 'O' at the beginning of the string." if text.match(/^O/)

puts "Found the string 'character'." if text.match(/character/)
puts "Found the word 'character'." if text.match(/characters\b/)

p text.scan(/\b[AEIOUaeiou][a-z]*\b/)

p text.scan(/\b[AEIOUaeiou][a-z]+\b/)

p text.scan(/\b[AEIOUaeiou][a-z]?\b/)

p text.scan(/\b[AEIOUaeiou][a-z]\b/)

p text.scan(/\b[A-Za-z]+\b+ \b[AEIOUaeiou][a-z]*\b/)
p text.scan(/\b([A-Za-z]+)\b +\b[AEIOUaeiou][a-z]*\b/)
p text.scan(/\b([A-Za-z]+)\b +\b([AEIOUaeiou][a-z]*)\b/)

p text.scan(/\b[^AEIOUaeiou ][^ ]*\b/)

txt = "Regular expressions are powerful (and sometimes confusing, even to experienced developers)."

p txt.scan(/\(.*\)/)
p txt.scan(/\((.*)\)/)





