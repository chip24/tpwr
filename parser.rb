require "parslet"

class ConfigParser < Parslet::Parser 
  rule(:name) { match("\\w").repeat(1).as(:name) }
  rule(:whitespace) { match("[ \\t]").repeat(1) }
  rule(:assignment) { whitespace.maybe >> str("=") >> whitespace.maybe }
  rule(:newline) { str("\n") | str("\r\n") }
  rule(:value) {
    str('"') >>
    (str('"').absent? >> any).repeat.as(:string) >> str('"')
  }
  rule(:item) { name >> assignment >> value.as(:value) >> newline }
  rule(:document){ (item.repeat).as(:document) >> newline.repeat }

  root :document
end

config = ConfigParser.new.parse(File.read("config.txt"))
#puts config[:document][0][:value][:string]

class ConfigToHash < Parslet::Transform 
  rule(string: simple(:s)) {
    case s 
    when "true"
      true
    when "false"
      false
    when /\A[0-9]+\z/
      Integer(s)
    else
      String(s)
    end
  }
  rule(name: simple(:n), value: simple(:v)) { [String(n), v] }
  rule(document: subtree(:i)) { i.to_h }
end

  def parse_config(config_file)
    parsed = ConfigParser.new.parse(File.read(config_file))
    config = ConfigToHash.new.apply(parsed)

    config 
  end


  p config = parse_config("config.txt")






