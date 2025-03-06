require "csv"

CSV.open("writing.csv", "w") do |csv| 
  csv << ["field one", "field two", "field three"]
  csv << ["another field one", "another field two", "field three, again"]
end

puts File.read("writing.csv")

