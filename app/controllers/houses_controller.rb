class HousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  require 'open-uri'
  require 'nokogiri'

  def index
    @houses = House.all

    # récupérer les bons paramètres pour district et price
    # district = district.name
    # price = house.price
    # ("https://lalilloise-immobilier.fr/annonces/?type=&localite=#{district}&prix=#{price}")

    @results = []

    html_content = URI.open("https://lalilloise-immobilier.fr/annonces/")
    html_doc = Nokogiri::HTML(html_content)
    html_doc.search('.card').each do |element|
    square_meter = element.search(".annonce-infos li").first.text
    room_number = element.search(".annonce-infos li")[1].text
    name = element.search(".card-content .cat-name").text
    description = element.search(".annonce-accroche").text
    price = element.search(".price").text
    url_image = element.search(".attachment-annonce-thumb").attr('data-src').value
      if (square_meter.to_i >= 50) && (room_number.to_i >= 3) && (price >= "100 000 €")
        @results << [name: name, description: description, url_image: url_image, square_meter: square_meter, room_number: room_number, price: price]
    end

    end
  end
end



# methode pour avoir seulement les annonces avec ou + le nombres de pièces demandés
# @room_numbers.each do |room|

# end

# methode pour avoir seulement les annonces avec ou + le nombres de m² demandés
# @square_meters.each do |meter|
#   if
#     p meter
#   end
# end

# if room.to_i >= 3 && meter.to_i >= 70
