require "open-uri"
require "readability"
require "phrasie"
require "json"
require "json/add/core"

urls = File.readlines("urls.txt").map(&:chomp)

Article = Struct.new(:title, :text, :terms)

ignored_terms = ["^", "pp", "citation", "ISBN", "Retrieved", "[edit"]

articles = urls.map do |url| 
  $stderr.puts "Pocessing #{url}..."

  html = URI.open(url).read 
  document = Readability::Document.new(html)

  title = document.title.sub(" - Wikipedia, the free encyclopedia", "")
  text = Nokogiri::HTML(document.content).text.strip

  terms = Phrasie::Extractor.new.phrases(text)
  terms = terms.reject { |term| ignored_terms.include?(term.first) }

  Article.new(title, text, terms)
end

articles.each do |article| 
  puts article.title
  puts "Keywords: #{article.terms.take(10).map(&:first).join(", ")}\n\n"
end

File.open("articles.json", "w") do |json| 
  json.write(JSON.generate(articles))
end

# start on page 171 on 1-19
