# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require 'geokit'
require_relative "polygone_maker"

District.destroy_all
Interest.destroy_all

# seeds district
lomme = District.create(name: "Lomme", image: "https://lvdneng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2020/12/11/node_906273/49852409/public/2020/12/11/B9725502404Z.1_20201211112641_000%2BGRUH7O58T.2-0.jpg?itok=T6T9w46h1607682408", description: "Lomme est une ancienne commune française très prisée des familles rattachée à Lille, en pleine expansion grâce à la proximité d'Euratechnologies, berceau de la French Tech Lilloise.")
bois_blanc = District.create(name: "Bois-Blancs", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/bandeau-bois-blancs/2586156-2-fre-FR/bandeau-bois-blancs_page_banner_image_bannerview.png", description: "Quartier émergent et vert traversé par le canal et la rivière Deûle, où des péniches colorées sont amarrées le long des quais. Des pistes de jogging bordent les cours d'eau, appréciés des amateurs de kayak et de sup paddle. EuraTechnologies et ses jardins d'eau en font un quartier actif en semaine.")
wazemmes = District.create(name: "Wazemmes", image: "https://lilleaddict.fr/wordpress/wp-content/uploads/2021/04/marche-lille.jpg", description: "Quartier cosmopolite, historique, et très animé les jours de marché. Les Halles abritent de nombreux petits commerces pour le quotidien. La Maison Folie, avec sa façade métallique futuriste, est un centre d'art qui propose concerts et ateliers pour enfants.")
lille_sud = District.create(name: "Lille-Sud", image: "https://lvdneng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2019/05/31/node_625972/40457393/public/2019/05/31/B9719766830Z.1_20190531143639_000%2BGJ5DO74TT.1-0.jpg?itok=dFGG8E7F1578430072", description: "Lille-Sud est un quartier en réhabilitation comprenant de nouveaux complexes tels qu'Eurasanté, la Halle de Glisse, le Jardin des Plantes et des lotissements modernes. Les bars, brasseries et boulangeries sont fréquentées par les étudiants de médecine du CHRU.")
lille_moulins = District.create(name: "Lille-Moulins", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/bandeau-moulins/2586140-1-fre-FR/bandeau-moulins_page_banner_image_bannerview.jpg", description:"Ce quartier post-industriel est une enclave émergente avec des bars et des cafés avant-gardistes. La Maison Folie Moulins propose des films et des pièces. Une serre tropicale futuriste surplombe les parterres de fleurs raffinés du jardin botanique établi au XVIe siècle.")
faubourg_de_bethune = District.create(name: "Faubourg de Béthune", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/header-faubourg/2586214-1-fre-FR/header-faubourg_page_banner_image_bannerview.jpg", description: "Situé au sud du boulevard de Metz et traversé par des routes périphériques très fréquentées, le Faubourg de Béthune est connu pour ses rues résidentielles décorées de graffitis et ses immeubles élevés en cours de réhabilitation. Ce quartier est familial, et en pleine réhabilitation.")
hellemmes = District.create(name: "Hellemmes", image: "https://upload.wikimedia.org/wikipedia/commons/a/ae/Mairie_d%27_Hellemmes-Lille.jpg", description: "Hellemmes-Lille est un quartier familial en pleine croissance. Sa proximité avec le centre grâce aux transports en commun en fait un quartier de choix pour les familles et les personnes à la recherche de calme.")
vauban_esquermes = District.create(name: "Vauban-Esquermes", image: "https://images.unsplash.com/photo-1610064980867-ae10cf264e1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80", description: "Doté d'une importante communauté étudiante, ce quartier animé est connu pour ses cafés branchés et bars d'angle. Les joggeurs, les cyclistes, les familles et les pique-niqueurs apprécient le jardin paysager de Vauban, sa Citadelle, le zoo, le parc d'attractions et les espaces verts du bois de Boulogne, au bord de la Deûle.")
saint_maurice_pellevoisin = District.create(name: "Saint-Maurice Pellevoisin", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/bandeau-st-maurice/2586152-1-fre-FR/bandeau-st-maurice_page_banner_image_bannerview.jpg", description: "Dans ce quartier dynamique situé derrière les gares, les maisons médiévales en bois côtoient les villas majestueuses. Une population jeune, active, ainsi que des familles se rendent dans les cafés avant-gardistes regroupés autour du parc verdoyant des Buissonnets et du jardin des Géants.")
lille_centre = District.create(name: "Lille-Centre", image: "https://www.voyageway.com/wp-content/uploads/2019/07/ou-dormir-a-lille-grand-place.jpg", description: "Épicentre de Lille avec ses nombreux batiments d'époque flamande, c'est le coeur de Lille avec ses commerces, ses restaurants, son Opéra et son Théatre. La gare rénovée de Lille-Saint-Sauveur accueille des concerts et des expositions d'art. Le Palais des Beaux-Arts abrite des œuvres de maîtres européens, dont Raphaël et Rubens.")
vieux_lille = District.create(name: "Vieux-Lille", image: "http://blog.luckyloc.com/wp-content/uploads/2018/05/Vieux-Lille.jpg", description: "Quartier historique pavé de rues et ruelles au charme d'antan, très prisé des jeunes actifs. Il conserve encore de nombreuses rues pavées et quelques traces des canaux qui sillonnaient la ville aux siècles passés. Le soir, il est animé par la Rue Royale et la Rue de Gand.")
fives = District.create(name: "Fives", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/bandeau-fives/2586148-1-fre-FR/bandeau-fives_page_banner_image_bannerview.jpg", description:"Quartier éclectique et post-industriel qui fait l'objet d'une rénovation complète. Les rues animées regorgent de petits restaurants et cafés. Un marché alimentaire très fréquenté s'y tient chaque dimanche.")

# seeds Type

Type.destroy_all
vlille = Type.create(category: 'transport', name: 'vlille')
bus = Type.create(category: 'transport', name: 'bus')
metro = Type.create(category: 'transport', name: 'metro')
tram = Type.create(category: 'transport', name: 'tram')
historical_monuments = Type.create(category: 'hobbies', name: 'historical monuments')
movie_theater = Type.create(category: 'hobbies', name: 'movie_theater')
parc = Type.create(category: 'hobbies', name: 'parcs')
swimming_pool = Type.create(category: 'hobbies', name: 'swimming_pool')
library = Type.create(category: 'hobbies', name: 'library')

# seeds Interest
polygone_maker = PolygoneMaker.new('db/data-mel/district/limite-des-quartiers-de-lille-et-de-ses-communes-associees.geojson')

# seeds Interest Transport
# seeds Interest Vlille
filepath = "db/data-mel/transport/vlille-realtime.json"

type_transport_vlille = JSON.parse(File.read(filepath))

transport_vlille = type_transport_vlille.map do |element|
  adresse = element["fields"]["adresse"]
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  # interest = Interest.new(address: @adresse, longitude: @longitude, latitude: @latitude, type: @vlille )
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(address: adresse, longitude: longitude, latitude: latitude, type: vlille, district: district)
  end
end




# seeds Interest Bus

filepath = "db/data-mel/transport/arrets-bus.json"

type_transport_bus = JSON.parse(File.read(filepath))

transport_bus = type_transport_bus.map do |element|
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(longitude: longitude, latitude: latitude, type: bus, district: district)
  end
end


# seeds Interest metro

filepath = "db/data-mel/transport/stations-metro.json"

type_transport_metro = JSON.parse(File.read(filepath))

transport_metro = type_transport_metro.map do |element|
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(longitude: longitude, latitude: latitude, type: metro, district: district)
  end
end

# seeds Interest Tram

filepath = "db/data-mel/transport/arrets-tram.json"

type_transport_tram = JSON.parse(File.read(filepath))

transport_tram = type_transport_tram.map do |element|
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(longitude: longitude, latitude: latitude, type: tram, district: district)
  end
end

# Hobbies Interests
# Hobbies Interests --> Monuments Historiques

filepath = "db/data-mel/hobbies/monuments-historiques-lille.json"

type_hobbies_historical_monuments = JSON.parse(File.read(filepath))
polygone_maker = PolygoneMaker.new('db/data-mel/district/limite-des-quartiers-de-lille-et-de-ses-communes-associees.geojson')


hobbies_historical_monuments = type_hobbies_historical_monuments.map do |element|
  adresse = element["fields"]["adresse"]
  longitude = element["fields"]["coord_geo"].split(",")[1]
  latitude = element["fields"]["coord_geo"].split(",")[0]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(address: adresse, longitude: longitude, latitude: latitude, type: historical_monuments, district: district)
  end
end

Interest.create!(address: "Place de la République, 59000 Lille", longitude: "50.372955", latitude: "3.032788", type: historical_monuments, district: lille_centre)
Interest.create!(address: "23 Rue Gosselet, 59000 Lille", longitude: "50.372159", latitude: "3.036000", type: historical_monuments, district: lille_centre)
Interest.create!(address: "32 Rue de la Monnaie, 59000 Lille", longitude: "50.382800", latitude: "3.034741", type: historical_monuments, district: vieux_lille)
Interest.create!(address: "8 rue Princesse, 59000 Lille", longitude: "50.384524", latitude: "3.03316764", type: historical_monuments, district: vieux_lille)

# Seeds Interest : Hobbies --> Cinémas
Interest.create!(address: "40 Rue de Béthune, 59000 Lille", longitude: "50.3821527", latitude: "3.03479279", type: movie_theater, district: lille_centre)
Interest.create!(address: "54 Rue de Béthune, 59000 Lille", longitude: "50.633577", latitude: "3.062750", type: movie_theater, district: lille_centre)
Interest.create!(address: "26 Rue des Ponts de Comines, 59000 Lille", longitude: "50.636557", latitude: "3.067008", type: movie_theater, district: lille_centre)
Interest.create!(address: "16 Rue Georges Danton, 59000 Lille", longitude: "50.623713", latitude: "3.074401", type: movie_theater, district: lille_moulins)
Interest.create!(address: "18 Rue Gosselet, 59000 Lille", longitude: "50.625981", latitude: "3.066018", type: movie_theater, district: lille_centre)

# Seeds Interest : Hobbies --> Parcs
Interest.create!(address: "Voie Piétonne du Bois de la Deûle, 59000 Lille", longitude: "50.642564", latitude: "3.038913", type: parc, district: lille_centre)
Interest.create!(address: "Boulevard Jean-Baptiste Lebas, 59000 Lille", longitude: "50.626234", latitude: "3.068452", type: parc, district: lille_centre)
Interest.create!(address: "Boulevard Vauban, 59000 Lille", longitude: "50.636628", latitude: "3.050466", type: parc, district: lille_centre)
Interest.create!(address: "306 Rue du Jardin des Plantes, 59000 Lille", longitude: "50.615411", latitude: "3.067955", type: parc, district: lille_moulins)

# Seeds Interest : Hobbies --> Piscines
Interest.create!(address: "36 Avenue Max Dormoy, 59000 Lille", longitude: "50.635307", latitude: "3.034147", type: swimming_pool, district: bois_blanc)
Interest.create!(address: "1 Boulevard Eugene Duthoit, 59000 Lille", longitude: "50.607327", latitude: "3.042171", type: swimming_pool, district: lille_sud)
Interest.create!(address: "82 Rue du Long Pot, 59000 Lille", longitude: "50.628673", latitude: "3.088158", type: swimming_pool, district: fives)
Interest.create!(address: "433bis Avenue de Lomme, 59000 Lille", longitude: "50.613811", latitude: "3.042360", type: swimming_pool, district: lomme)
Interest.create!(address: "19 Rue du Progrès, 59000 Lille", longitude: "50.630041", latitude: "3.118585", type: swimming_pool, district: hellemmes)

# Seeds Interest : Hobbies --> Bibliothèques
filepath = "db/data-mel/hobbies/bibliotheques-mel.json"

type_hobbies_libraries = JSON.parse(File.read(filepath))
polygone_maker = PolygoneMaker.new('db/data-mel/district/limite-des-quartiers-de-lille-et-de-ses-communes-associees.geojson')


hobbies_libraries = type_hobbies_libraries.map do |element|
  adresse = element["fields"]["adresse"]
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(address: adresse, longitude: longitude, latitude: latitude, type: library, district: district)
  end
end

# seeds Interest : Santé
pharmacie = Type.create(category: 'santé', name: 'pharmacie')
hopital = Type.create(category: 'santé', name: 'hôpital')
veterinaire = Type.create(category: 'santé', name: 'vétérinaire')

# seeds Interest : Santé => Pharmacies

filepath_pharmacie = "db/data-mel/health/pharmacies.json"
type_health_pharmacie = JSON.parse(File.read(filepath_pharmacie))

health_pharmacie = type_health_pharmacie.map do |element|
  adresse = element["fields"]["adresse"]
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(address: adresse, longitude: longitude, latitude: latitude, type: pharmacie, district: district)
  end
end

# seeds Interest : Santé => Hopitaux

Interest.create!(address: "2 Av. Oscar Lambret", longitude: "50.609859", latitude: "3.032916", type: hopital, district: lille_sud)
Interest.create!(address: "Bd de Belfort", longitude: "50.619797", latitude: "3.075907", type: hopital, district: lille_moulins)
Interest.create!(address: "44 Av. Marx Dormoy", longitude: "50.634577", latitude: "3.032350", type: hopital, district: bois_blanc)
Interest.create!(address: "Rue du Grand But", longitude: "50.650250", latitude: "2.979720", type: hopital, district: lomme)

# seeds Interest : Santé => Vétérinaires

Interest.create!(address: "598 Av. de Dunkerque, 59160 Lille", longitude: "50.646552", latitude: "3.009247", type: veterinaire, district: lomme)
Interest.create!(address: "6 Av. de la République, 59160 Lille", longitude: "50.640050", latitude: "3.017594", type: veterinaire, district: lomme)
Interest.create!(address: "4c Rue Philippe-Laurent Roland, 59000 Lille", longitude: "50.632647", latitude: "3.043344", type: veterinaire, district: vauban_esquermes)
Interest.create!(address: "26 Bd Montebello, 59000 Lille", longitude: "50.624666", latitude: "3.040856", type: veterinaire, district: vauban_esquermes)
Interest.create!(address: "80 Bd Montebello, 59000 Lille", longitude: "50.624666", latitude: "3.040856", type: veterinaire, district: vauban_esquermes)
Interest.create!(address: "94 Bd Montebello, 59000 Lille", longitude: "50.624666", latitude: "3.040856", type: veterinaire, district: vauban_esquermes)
Interest.create!(address: "195 Rue Nationale, 59800 Lille", longitude: "50.630796", latitude: "3.050382", type: veterinaire, district: lille_centre)
Interest.create!(address: "80 Rue Masséna, 59800 Lille", longitude: "50.630469", latitude: "3.054330", type: veterinaire, district: wazemmes)
Interest.create!(address: "43 Quai des Chevillards, 59800 Lille", longitude: "50.646800", latitude: "3.056905", type: veterinaire, district: vieux_lille)
Interest.create!(address: "112 Rue du Faubourg de Roubaix, 59800 Lille", longitude: "50.640595", latitude: "3.082139", type: veterinaire, district: saint_maurice_pellevoisin)
Interest.create!(address: "84 Rue de Philadelphie, 59800 Lille", longitude: "50.632538", latitude: "3.098275", type: veterinaire, district: fives)
Interest.create!(address: "33 Rue Jacquard, 59260 Lille", longitude: "50.633518", latitude: "3.104455", type: veterinaire, district: fives)
Interest.create!(address: "114 Rue Roger Salengro, 59260 Lille", longitude: "50.628917", latitude: "3.105683", type: veterinaire, district: fives)

# seeds Interest : Vie quotidienne
supermarket = Type.create(category: 'vie quotidienne', name: 'supermarché')
school = Type.create(category: 'vie quotidienne', name: 'école')
kids_park = Type.create(category: 'vie quotidienne', name: 'parc à jeux')

# seeds Interest : Vie quotidienne =>
filepath_supermarket = "db/data-mel/daily/magasins-et-boutiques.json"
type_daily_supermarket = JSON.parse(File.read(filepath_supermarket))

daily_supermarket = type_daily_supermarket.map do |element|
  adresse = element["fields"]["adresse"]
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(address: adresse, longitude: longitude, latitude: latitude, type: supermarket, district: district)
  end
end

# seeds Interest : Vie quotidienne => Ecoles
filepath_school = "db/data-mel/daily/adresse-et-geolocalisation-des-etablissements-denseignement-du-premier-et-second.json"
type_daily_school = JSON.parse(File.read(filepath_school))

daily_school = type_daily_school.map do |element|
  adresse = element["fields"]["adresse"]
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(address: adresse, longitude: longitude, latitude: latitude, type: school, district: district)
  end
end

# seeds Interest : Vie quotidienne => Air de jeu
filepath_kids_park = "db/data-mel/daily/aires-de-jeux.json"
type_daily_kids_park = JSON.parse(File.read(filepath_kids_park))

daily_kids_park = type_daily_kids_park.map do |element|
  adresse = element["fields"]["adresse"]
  longitude = element["geometry"]["coordinates"][0]
  latitude = element["geometry"]["coordinates"][1]
  city_name = polygone_maker.which_city(latitude, longitude)
  unless city_name.nil?
    district = District.find_by(name: city_name)
    interest = Interest.create!(address: adresse, longitude: longitude, latitude: latitude, type: kids_park, district: district)
  end
end

puts 'Finished!'
# Interest.create(adresse, )
