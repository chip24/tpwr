url = "https://example.com"

matches = url.match(/([a-z]+):\/\/([\w\.]+)/)
if matches
  puts matches[0]
  puts matches[1]
  puts matches[2]
end

