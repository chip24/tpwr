require "stringio"

def capture_output(&block)
  old_stdout = $stdout
  new_stdout = StringIO.new 

  $stdout = new_stdout 
  block.call 
  new_stdout.string 

ensure 
  $stdout = old_stdout 
end

output = capture_output do 
  puts "Hello world!"
  system "echo 'Hello, world'"
end

puts output.upcase  
