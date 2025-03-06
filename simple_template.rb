require "erb"

template = "The time is <%= Time.now.strftime('%T') %>"

renderer = ERB.new(template)
puts renderer.result

