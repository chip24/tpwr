require "builder"

builder = Builder::XmlMarkup.new(:indent => 2)

xml = builder.gallery do |gallery| 
  gallery.name "The National Gallery"
  gallery.location "London, UK"

  gallery.collection do |collection| 
    collection.painting(
      name: "Anna and the Blind Tobit",
      artist: "Rembrandt",
      year: 1630
      )
    collection.painting(
      name: "The Stonemason's Yard",
      artist: "Canaletto",
      year: 1725
      )
  end
end

puts xml