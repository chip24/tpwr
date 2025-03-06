File.open("wksst8110.for") do |file| 
  weeks = []
  
  until file.eof?
    week = {
    date: file.read(10).strip,
    temps: {}
  }

  [:nino12, :nino3, :nino34, :nino4].each do |region|
    week[:temps][region] = {
      temp: file.read(9).to_f,
      change: file.read(4).to_f
    }
  end

  file.read(1)
  weeks << week 

end
p weeks
end


