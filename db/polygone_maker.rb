require 'geokit'
require 'json'

# file = File.read('./data-mel/district/limite-des-quartiers-de-lille-et-de-ses-communes-associees.geojson')
# district_json = JSON.parse(file)
# p district_json["features"]
# district_geo_json = RGeo::GeoJSON.decode(file, json_parser: :json)
# p district_geo_json


class PolygoneMaker
  attr_reader :hash

  def initialize(path)
    file = File.read(path)
    @district_json = JSON.parse(file)["features"]
    transform_to_hash
  end

  def transform_to_hash
    @hash = {}
    @district_json.each do |district|
      name = district["properties"]["quartier"]
      coordinates = district["geometry"]["coordinates"]
      points = []
      coordinates.each do |set|
        set.each do |coord|
          points << Geokit::LatLng.new(coord[1], coord[0])
        end
      end
      polygone = Geokit::Polygon.new(points)
      @hash[name] = polygone
    end
    @hash
  end

  def which_city(latitude, longitude)
    point = Geokit::LatLng.new(latitude, longitude)
    @hash.each do |key, value|
      return key if value.contains?(point)
    end
    return nil
  end
end


# maker = PolygoneMaker.new('db/data-mel/district/limite-des-quartiers-de-lille-et-de-ses-communes-associees.geojson')

# bois_blanc_vlille = Geokit::LatLng.new("50.634045", "3.030778")

# p maker.which_city("50.633618", "3.067658")

# points = []
# bois_blanc_polygone.each do |set|
#   set.each do |coord|
#     points << Geokit::LatLng.new(coord[1],coord[0])
#   end
#   puts points
# end

# polygone = Geokit::Polygon.new(points)


# la_madeleine = Geokit::LatLng.new("50.651497", "3.072316")
# bois_blanc_vlille = Geokit::LatLng.new("50.634045", "3.030778")
# puts polygone.contains? la_madeleine
# puts polygone.contains? bois_blanc_vlille
