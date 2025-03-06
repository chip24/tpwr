require "date"

file = File.new("discography.txt")

contents = file.read

contents.gsub(/^(?<year>[0-9]{4}) - (?<album>.+)$/) do |match| 
  album_year = $~[:year].to_i
  years_ago = Date.today.year - album_year
  title = $~[:album]

  puts "#{title} (#{years_ago} years ago)"
end

