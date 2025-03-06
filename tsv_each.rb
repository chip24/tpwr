File.open("shopping.tsv") do |file| 
  file.each_line do |record| 
    p record 
  end
end