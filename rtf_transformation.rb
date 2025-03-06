require "parser.rb"

class RtfToHtml < Parslet::Transform
  rule(int: simple(:n)) { Integer(n) }
  rule(text: simple(:t)) { String(t) }
  rule(red: simple(:r), green: simple(:g), blue: simple(:b)) {
    "rgb(#{r}, #{g}, #{b})"
  }
  rule(control_word: { word: simple(:_), delimiter: simple(:_) }) {
""
}
  rule(control_word: { word: "line", delimiter: simple(:x)}){ "<br>"}
  rule(control_word: {word: "b", delimiter: simple(:_)}) { "</strong>"}
  rule(control_word: {word: "b", delimiter: "0"}) { "</strong>"}
  rule(control_word: { word: "cf", delimiter: simple(:n)}) { "<span class=\"cf-#{n}\">" }
  rule(colors: subtree(:c)) {
    html = "<style>/n"

    c.each_with_index do |c, n| 
      html << ".cf-#{n+1} {color: #{c}}"
      html << ".cb-#{n+1} {background-color: #{c}}\n"
    end

    html << "</style>"

    html
  }
  rule(header: subtree(:h), document: subtree(:d)) {
    html = <<-HTML
    <!DOCTYPE html>
    <html>
    <head>
      #{h[:color_table]}
    </head>
    <body>
      #{d.join("\n")}
    </body>
    </html>
        HTML

  }
end

rtf = Rtf.new
parsed = rtf.parse(File.read("colors.rtf"))
html = RtfToHtml.new.apply(parsed)


