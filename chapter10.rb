require 'strscan'

scanner = StringScanner.new("The quick brown fox jumped over the lazy dog.")

p scanner.pos
p scanner.scan(/The/)
p scanner.pos
p scanner.scan(/The/)
p scanner.pos

parentheticals = []
scanner = StringScanner.new("'Hello, ' he (the man) said. (To no one in particular.) 'How are you?'")

until scanner.eos? || scanner.check_until(/\(/).nil?
  scanner.skip_until(/\(/)
  parentheticals << scanner.scan_until(/(?=\))/)
end

p parentheticals

# on 2-15 start on page 146 at Rule-Based Parsers

