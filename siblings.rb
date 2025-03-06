require 'nokogiri'

doc = Nokogiri::HTML(<<-DOC)
<html>
<body>
<ul><li>List item one</li><li>List item two</li></ul>
</body>
</html>
DOC

first_li = doc.at_css("li")
second_li = first_li.next_sibling
p second_li.text

first_li = second_li.previous_sibling
p first_li.text




