require 'json'
require 'json/add/core'

require 'text'

def normalize_term(term)
  term.downcase.gsub("-"," ")
end

Article = Struct.new(:title, :text, :terms)
articles = JSON.parse(File.read("articles.json"), create_additions: true)

query = normalize_term(ARGV[0])

metaphone_query = Text::Metaphone.metaphone(query)

matches = 
  articles
    .select { |article| 
      article.terms.find { |term, _| 
        Text::Levenshtein.distance(term, query ) <= 2 ||
          Text::Metaphone.metaphone(term) == metaphone_query
      }
    }

    if matches.length > 0
      matches.each { |article| puts article.title }
    else
      puts "No matches"
    end