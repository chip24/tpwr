p "Do you like cats?" =~ /like/

if "Do you like cats?".match(/like/)
  puts "Match found!"
end

def contains_vowel(str)
  str =~ /[aeiou]/
end

p contains_vowel("test")
p contains_vowel("sky")

def contains_number(str)
  str =~ /[0-9]/
end

p contains_number("The year is 2015")
p contains_number("The cat is black")

p "5a5".match(/\d.\d/)
p "5a5".match(/\d\.\d/)
p "5.5".match(/\d\.\d/)

def ip_address?(str)
  !!(str =~
    /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
end

p ip_address?("192.168.1.1")
p ip_address?("0000.0000")

p "Regex are cool".match /\w{4}/
p "Regex are cool".match /^\w{4}$/

Line = Struct.new(:time, :type, :msg)
LOG_FORMAT = /(\d{2}:\d{2}) (\w+) (.*)/

def parse_line(line)
  line.match(LOG_FORMAT) { |m| Line.new(*m.captures)}
end

p parse_line("12:41 INFO User has logged in.")


m = "John 31".match /\w+ (\d+)/
p m[0]
p m[1]

n = "David 30".match /(?<name>\w+) (?<age>\d+)/
p n[:age]
p n[:name]

def number_after_word?(str)
  !!(str =~ /(?<=\w) (\d+)/)
end

p number_after_word?("Grade 99")

p "abc".match?(/[A-Z]/i)

LOG_FORMAT_TWO = %r{
  (\d{2}:\d{2}) # Time
  \s(\w+) # Event Type
  \s(.*) # Message
}x

p "this is some string".scan(/\w+/)

p "The year was 1492".scan(/\d+/)

strg = "lord of the rings"

p strg.gsub(/\w+/) {|w| w.capitalize}

email = "test@example.com"

# the two p statements below are the same. !! turns a value into a Boolean
p !!email.match(/\A[\w.+-]+@\w+\.\w+\z/)
p email.match?(/\A[\w.+-]+@\w+\.\w+\z/)


