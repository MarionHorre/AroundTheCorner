class HousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  require 'open-uri'
  require 'nokogiri'

  def index
    #scrapping_lilloise

    #Hash par catégorie avec les params du form
    square_meters_form = params[:house]['square_meter'].to_i
    rooms_number_form = params[:house]['number_of_room'].to_i
    minimal_price_form = params[:house]['min_price'].to_i
    maximal_price_form = params[:house]['max_price'].to_i


    @houses = House.where("CAST(square_meters AS int) >= ? AND CAST(room_number AS int) >= ? AND CAST(price AS int) BETWEEN ? AND ?", square_meters_form, rooms_number_form, minimal_price_form, maximal_price_form)


    # récupérer les bons paramètres pour district et price
    # district = district.name
    # price = house.price
    # ("https://lalilloise-immobilier.fr/annonces/?type=&localite=#{district}&prix=#{price}")
  end

  private

  def lilloise_url
    html_content = URI.open("https://lalilloise-immobilier.fr/annonces/")
    Nokogiri::HTML(html_content)
  end

  def scrapping_lilloise
    lilloise_url.search('.card').each do |element|
      square_meter = element.search(".annonce-infos li").first.text.match(/\d{2,3}\b(,)/)[0][0..-2].to_i
      room_number = element.search(".annonce-infos li")[1].text.to_i
      name = element.search(".card-content .cat-name").text
      description = element.search(".annonce-accroche").text
      price = element.search(".price").text[0..-2].gsub(" ", "").to_i
      link = element.search(".card-link")[0]['href']
      rescue_link(link)
      unless House.find_by(name: name, description: description, price: price)
        url_image = element.search(".attachment-annonce-thumb").attr('data-src').value.gsub(/400x200/, '640x480')
        House.create!(name: name, description: description, image: url_image,
                      square_meters: square_meter, room_number: room_number, price: price,
                      link: link)
      end
    end
  end

  def rescue_link(link_url)
    Nokogiri::HTML(URI.open(link_url))
  rescue OpenURI::HTTPError => e
    puts "Can't access #{link_url}"
    puts e.message
  end
end
