require "builder"

builder = Builder::XmlMarkup.new(:indent => 2)

xml = builder.car do |car| 
  car.make "Ford"
  car.model "Model T"
  car.engine do |engine| 
    engine.size "2.9 L"
    engine.power "20 hp"
  end
end

puts xml
