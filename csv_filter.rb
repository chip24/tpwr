require "csv"

File.open("shopping-with-header.csv") do |input_file| 
  File.open("shopping-dollars.csv", "w") do |output_file| CSV.filter(input_file, output_file, headers: true) do |record|
    dollars = record["Price"].sub(/^£/, "").to_f * 1.58 
    record["Price"] = "$%.2f" % dollars 
  end
end
end

puts File.read("shopping-dollars.csv")

# start on page 218 on 2-24