require 'nokogiri'

doc = Nokogiri::HTML(<<-DOC)
<html>
<body>
Some body text
<p>Some paragraph text</p>
</body>
</html>
DOC

p doc.at_css("body").text