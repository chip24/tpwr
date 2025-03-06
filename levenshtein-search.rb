query = normalize_term(ARGV[0])

matches = 
  articles
    .select { |article| 
      article.terms.find { |term, _| 
        Text::Levenshtein.distance(term, query) <= 2
      }
    }

    if matches.length > 0 
      matches.each { |article| puts article.title }
    else
      puts "No matches"
    end