require "open-uri"

urls = ARGF.readlines.map(&:chomp)
total_urls = urls.length

urls.each_with_index do |url, n| 
  $stderr.print "\rFetching url #{n + 1} of #{total_urls}..."
  html = URI.open(url).read
  puts "#{html.bytesize} bytes (#{url})"
end

$stderr.print "\r"
