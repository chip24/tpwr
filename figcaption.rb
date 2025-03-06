require 'nokogiri'

doc = Nokogiri::HTML(<<-DOC)
<html>
<body>
<figure>
<img src="example.jpg"><figcaption>This image has a caption</figcaption>
</figure>
<figure>
<img src="example-2.jpg">
</figure>
</body>
</html>
DOC

Image = Struct.new(:file, :caption)

doc.css("img").each do |img| 
  file = img["src"]

  caption = if img.next_sibling.name == "figcaption"
    img.next_sibling.text
  else
    "No caption"
  end

Image.new(file, caption)
end

#on 2-9-2025 start at Exploring a Page section on page 89
