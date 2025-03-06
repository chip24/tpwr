require "parslet"

class Rtf < Parslet::Parser
  rule(:space)      {str(" ") }
  rule(:hyphen)     {str("-") }
  rule(:integer)    {match["0-9"].repeat(1) }
  rule(:newline)    { str("\n") }
  rule(:slash)      { str("\\") }
  rule(:letter_sequence)  { match["a-z"].repeat }
  rule(:special_chars) { match["\\\\{}"] }

  rule(:unformatted_text) { 
    (special_chars.absent? >> any ).repeat(1).as(:text)
  }
  rule(:control_word) {
    (
    slash >>
    letter_sequence.as(:word) >>
    control_delimiter.maybe.as(:delimiter)
    ).as(:control_word)
  }
  rule(:control_delimiter) { space | ( hyphen.maybe >> integer ) | str(";")}

  rule(:group) {
    (
      str("{") >>
      newline.maybe >>
      content >>
      newline.maybe >>
      str("}") >>
      newline.maybe
      ).as(:group)
  }

  rule(:content) {
    (
      unformatted_text |
      control_word |
      group
      ).repeat
  }

  rule(:header) {
    (slash >> str("rtf") >> integer.maybe.as(:version) ).as(:rtf) >>
    (slash >> letter_sequence.as(:charset) ) >>
    (slash >> str("deff") >> integer.maybe).maybe.as(:deff) >> color_table.maybe.as(:color_table) >>
    newline.maybe
  }

  rule(:color_table) {
    newline.maybe >>
    str("{") >>
    (slash >> str("colortbl;")) >>
    color_definition.repeat(1).as(:colors) >>
    str("}") >>
    newline.maybe
  }

  rule(:color_definition) {
    slash >> str("red") >> (integer.as(:int)).as(:red) >>
    slash >> str("green") >> (integer.as(:int)).as(:green) >>
    slash >> str("blue") >> (integer.as(:int)).as(:blue) >>
    str(";")
  }

  rule(:file) {
    str("{") >>
    header.as(:header) >>
    content.as(:document) >>
    str("}") >>
    newline.maybe
  }

root :file
end

rtf = Rtf.new 
p rtf.parse(File.read("colors.rtf"))

# on 2-17 start at Applying a Transformation on page 160
