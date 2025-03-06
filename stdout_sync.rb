$stdout.sync = true

100.times do 
  "hello world".each_char do |c|
    print c 
    sleep 0.1 
  end
  print "\n"
end