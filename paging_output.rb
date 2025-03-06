def page_output 
  stdout = STDOUT.clone

  less = open("|less", "w") 
  STDOUT.reopen(less) 

  at_exit do 
    STDOUT.reopen(stdout)
    less.close 
    end
  end

  page_output if STDOUT.tty? 

  500.times do |n| 
    puts "#{n + 1}: Hello from Ruby"
    system "echo '#{n + 1}: Hello from a sub-shell'"
  end