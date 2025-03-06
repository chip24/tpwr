require "json"

class Person 
  attr :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_json(*)
    { "name" => name, "age" => age}.to_json
  end
end

person = Person.new("Alice", 32)
p [14, 42, person].to_json
#p person.to_json