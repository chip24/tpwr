# start at the end of page 70 on 2-8

File.open("shopping.tsv") do |file| 
  cheese_total = file.each_line
    .map {|line| line.chomp.split("\t")}
    .select {|_, _, shop| shop == "Cheese Shop"}
    .map {|_, price, _| price }
    .reduce(0.0) {|total, price| total + price[1..-1].to_f}
    .round(2)

    puts "£#{cheese_total}"
  end