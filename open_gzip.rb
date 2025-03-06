open("|gzip", "r+") do |gzip| 
  gzip.puts "foo"

  gzip.close_write

  File.open("foo.gz", "w") do |file| 
    file.write gzip.read 
  end
end