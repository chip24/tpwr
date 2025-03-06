require 'strscan'

text = "Eggs, cheese, onion, potato, peas"
scanner = StringScanner.new(text)

items = []

loop do 
  items << scanner.scan(/\w+/)
  if scanner.check(/,/)
    scanner.skip(/,\s*/)
  else
    break
  end
end

p items