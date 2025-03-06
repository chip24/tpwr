require "parslet"

class ConfigParser < Parslet::Parser
  rule(:name) { match("\\w").repeat(1).as(:name) }
  rule(:whitespace) { match("[ \\t]").repeat(1) }
  rule(:assignment) { whitespace.maybe >> str("=") >> whitespace.maybe }
  rule(:newline) { str("\n") | str("\r\n") }
  rule(:value) {
    str('"') >>
    (str('"').absent? >> any).repeat.as(:string) >>
    str('"')
  }
  rule(:item) { name >> assignment >> value.as(:value) >> newline }
  rule(:document) { (item.repeat).as(:document) >> newline.repeat }

  root :document
end

p config = ConfigParser.new.parse(File.read("config.txt"))