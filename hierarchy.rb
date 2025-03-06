require 'nokogiri'

doc = Nokogiri::HTML(<<-DOC)
<html>
<body>
<ul><li>List item one</li>
<li>List item two</li></ul>
</body>
</html>
DOC

list = doc.at_css("ul")

list_item = list.children.first
p list_item.name
p list_item.parent.name

