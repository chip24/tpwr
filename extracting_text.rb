require "open-uri"
require "readability"

urls = File.readlines("urls.txt").map(&:chomp)

Article = Struct.new(:title, :text, :terms)

articles = urls.map do |url| 
  $stderr.puts "Processing #{url}..."

  # new syntax (not in book) requires URI before open for open-uri
  html = URI.open(url).read
  document = Readability::Document.new(html)

  title = document.title.sub(" - Wikipedia, the free encyclopedia", "")
  text = Nokogiri::HTML(document.content).text.strip

  Article.new(title, text)
end