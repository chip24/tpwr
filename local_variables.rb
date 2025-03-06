require "erb"

def display_time
  time = Time.now.strftime("%T")
  template = "The time now is <%= time %>"

  renderer = ERB.new(template)
  puts renderer.result 
end

display_time