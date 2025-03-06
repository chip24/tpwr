require "json"

p "hello, world".to_json
p 42.to_json
p [1,1,2,3,5].to_json 
p ({ name: "Alice", age: 32 }.to_json)
#p {"name" "Alice", "age" => 32 }.to_json

