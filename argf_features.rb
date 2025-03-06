ARGF.each do |line| 
  if ARGF.filename != "-" && ARGF.file.lineno == 1
    puts "\n#{ARGF.filename} (#{ARGF.file.size} bytes):\n\n"
  end

  puts line
end