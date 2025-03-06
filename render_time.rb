require "erb"

puts "The time is #{Time.now.strftime('%T')}"
template = "The time is <%= Time.now.strftime('%T') %>"

renderer = ERB.new(template)

sleep 2

puts renderer.result