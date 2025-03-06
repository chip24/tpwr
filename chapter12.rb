# start on page 197 on 2-22

printf "%s %i", "the value is", 2.2678
puts "\n"
printf "%.2f", 2.2678
puts "\n"

inventory = { "Nuts" => 124, "Bolts" => 2891, "Hammers" => 79, "Nails" => 40 }

inventory.each do |product, items| 
  printf "%-8s %4d\n", product, items 
end

inventory.each do |product, items| 
  printf "%-5.5s %4d\n", product, items 
end



