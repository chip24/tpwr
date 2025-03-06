require "tempfile"

path = nil 

Tempfile.create("test") do |file| 
  path = file.path 
  puts File.exist? path 
end

puts File.exist? path 
