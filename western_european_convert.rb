# encoding: utf-8

File.open("western-european.txt", "r:iso-8859-1: utf-8") do |file| 
  p file.external_encoding
  contents = file.read 
  p contents
  p contents.encoding 
end