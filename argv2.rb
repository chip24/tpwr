options = { v: false }

ARGV.delete_if do |a| 
  a.start_with?("-") && options[a.sub(/^-/, "").to_sym] = true 
end

ARGF.each do |line| 
  puts line
end