require 'nokogiri'

doc = Nokogiri::HTML(<<-DOC)
<html>
<body>
<h2>This is a heading</h2>
<p>This is a paragraph</p>
<h2>This is also a heading</h2>
<p>This is also a paragraph</p>
</body>
</html>
DOC

doc.css("h2").each do |heading| 
  p heading.text
end
