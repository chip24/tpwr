require "open-uri"
require "readability"

# new open-uri syntax requires URI in front, which the book doesn't have
html = URI.open("http://en.wikipedia.org/wiki/History_of_Luxembourg").read
document = Readability::Document.new(html)

article = Nokogiri::HTML(document.content)
p article.css("p").first.text