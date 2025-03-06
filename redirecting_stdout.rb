def capture_output(&block) 
  stdout = STDOUT.clone 

  read_io, write_io = IO.pipe 
  read_io.sync = true 

  output = ""
  reader = Thread.new do 
    begin 
      loop do 
        output << read_io.readpartial(1024)
      end
    rescue EOFError 
    end
  end

  STDOUT.reopen(write_io) 
  block.call 
ensure 
  STDOUT.reopen(stdout) 
  write_io.close 
  reader.join 

  return output 
end
