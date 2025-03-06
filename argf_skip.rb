ARGF.each do |line| 
  unless ARGF.filename.end_with?(".txt")
    ARGF.skip
    next
  end

  puts line
end