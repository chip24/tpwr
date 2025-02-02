#File.open("file.txt") do |file| 
#  contents = file.read 
#end

=begin
File.open("access_log") do |log_file|
  log_file.each_line do |request|
    if request.start_with?("127.0.0.1")
      puts request
    end
  end
end
=end

File.foreach("access_log") do |request| 
  if request.start_with?("127.0.0.1")
    puts request
  end
end

requests = File.open("access_log") do |file|
  file 
    .map {|line| {ip: line.split[0], url: line.split[5]}}
    .group_by {|request| request[:ip]}
    .each {|ip, requests| requests.map! {|r| r[:url]}}
  end

  File.open("commas.txt") do |file| 
    file.each(",") do |record|
      puts record
    end
  end

  n = 0
  File.open("file.txt") do |file|
    file.each_char do |char|
      n += 1 if char == "Y"
    end
  end
  puts "#{n} Y chracters in file.txt"

  num =
    File.open("commas.txt") do |file| 
      file.each_char.count {|char| char == "f"}
    end

    puts "#{num} f charaters in commas.txt"

    File.open("wksst8110.for") do |file| 
      puts file.read(10)
      4.times do 
        puts file.read(9)
        puts file.read(4)
      end
    end
