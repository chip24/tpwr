require "tempfile"

file = Tempfile.new("test")
path = file.path 

begin 
  puts File.exist? path 
ensure
  file.close
  file.unlink 
end

puts File.exist? path 

#start on page 207 on 2-23