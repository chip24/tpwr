require 'csv'

CSV.foreach("shopping-with-header.csv", headers: true) do |record| 
  p record["Price"]
end