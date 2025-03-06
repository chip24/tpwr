url = "https://example.com"

if url =~ /\Ahttps:/
  puts "The URL is https"
else
  puts "The URL is not https"
end

p url.match?(/\Ahttps:/)

p "hello".gsub(/[aeiou]/, "")
