open("| sort | uniq -c | sort -rn | head -n 10 ", "w") do |sort| 
  open("error_log") do |log| 
    log.each_line do |line| 
      if line =~ /^\[.+\] \[error\] (.*)$/
        sort.puts $1 
      end
    end
  end
end
