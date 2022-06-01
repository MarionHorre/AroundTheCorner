# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"


# seeds district
# @bois_blanc = District.new(name: "Bois Blanc")

# seeds Type

Type.destroy_all
@vlille = Type.create(category: 'transport', name: 'vlille')

# seeds Interest

filepath = "db/data-mel/transport/vlille-realtime.json"

type_transport_vlille = JSON.parse(File.read(filepath))

@transport_vlille = type_transport_vlille.map do |element|
  @adresse = element["fields"]["adresse"]
  @longitude = element["geometry"]["coordinates"][0]
  @latitude = element["geometry"]["coordinates"][1]
  puts Interest.create!(address: @adresse, longitude: @longitude, latitude: @latitude, type: @vlille )
end
puts 'Finished!'
# Interest.create(adresse, )
