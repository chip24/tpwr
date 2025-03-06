require "json"
require "json/add/core"

Article = Struct.new(:title, :text, :terms)
articles = JSON.parse(File.read("articles.json"), create_additions: true)

query = ARGV[0]

matches = articles.select {|article| article.terms.assoc(query) }

if matches.length > 0 
  matches.each {|article| puts article.title }
else
  puts "No matches"
end

