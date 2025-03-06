url = "https://example.com"

url.match(/([a-z]+):\/\/([\w\.]+)/) do |matches| 
  puts matches[0]
  puts matches[1]
  puts matches[2]
end


