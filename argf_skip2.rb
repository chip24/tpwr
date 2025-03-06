ARGF.each do |line| 
  case ARGF.file.lineno 
  when 1
    puts "\n#{ARGF.filename}\n\n"
  when 6
    ARGF.skip
    next
  end

  puts line 
end
