require 'open-uri'
require 'nokogiri'
class UpdateScrappingJob < ApplicationJob
  queue_as :default


  def perform
    html_doc = URI.open("https://lalilloise-immobilier.fr/annonces/")
    html_parsed = Nokogiri::HTML(html_doc)

    html_parsed.search('.card').each do |element|
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
