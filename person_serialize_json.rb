require "json"

class Person 
  attr :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_json(*)
    {
      "json_class" => self.class.name,
      "data" => { "name" => name, "age" => age }
    }.to_json 
  end

  def self.json_create(object)
    data = object["data"]
    new(data["name"], data["age"])
  end
end

person = Person.new("Alice", 32)
p json = person.to_json 

p person = JSON.load(json)
p person.class
p person.name 
p person.age 
