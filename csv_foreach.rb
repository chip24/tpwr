require 'csv'

CSV.foreach("shopping.csv") do |record| 
  p record 
end