#!/usr/bin/env ruby
# $ chmod +x urls <-- might need to type this into the shell before you can use it

$stdin.each_line do |line| 
  urls = line.scan(%r{https?://\S+})
  urls.each do |url|
    puts url 
  end
end
