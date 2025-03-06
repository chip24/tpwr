5.times do 
  fork do 
    sleep 0.5 
    puts "I'm a new process!\n"
  end
end

Process.waitall 
