def normalize_term(term)
  term.downcase.gusb("-"," ")
end

terms = Phrasie::Extractor.new.phrases(text)
terms = terms.reject {| term| ignored_terms.include? (term.first) }
terms.each do |term| 
  term.unshift normalize_term(term.first)
end

query = normalize(ARGV[0])


