File.open("wksst8110.for") do |file| 
  file.seek(63)
  p file.read(10)
end