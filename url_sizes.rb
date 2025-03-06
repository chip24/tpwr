#!/usr/bin/env ruby

require "open-uri"

urls = ARGF.readlines.map(&:chomp)
total_urls = urls.length

urls.each_with_index do |url, n| 
  html = URI.open(url).read 
  puts "#{html.bytesize} bytes (#{url})"
end

