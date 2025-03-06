def get_week(file, week)
  file.seek((week-1) * 63)

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


  week 
end


File.open("wksst8110.for") do |file|
  p get_week(file, 3)
  p get_week(file, 303)
  p get_week(file, 1303)
end