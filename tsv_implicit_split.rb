$/ = "\n"
$; = "\t"

File.open("shopping.tsv") do |file| 
  file.each do |record|
    p record.chomp.split
  end
end