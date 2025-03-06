require "tempfile"

Tempfile.create("test") do |file| 
  puts file.path
end

