inventory = { "Nuts" => 124, "Bolts" => 2891, "Hammers" => 79, "Nails" => 40 }

longest = inventory.max_by { |product, items| product.length }
width = longest.first.length 

inventory.each do |product, items| 
  printf "%-*s %4d\n", width, product, items 
end

#start on page 191 on 2-21