require "erb"

template = File.read("simple-template.erb")

renderer = ERB.new(template)
puts renderer.result

#on 2-25 start on page 229 Passing Data to Templates