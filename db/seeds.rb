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
lomme = District.create(name: "Lomme", image: "https://edito.seloger.com/sites/default/files/edito_migrate/rue_du_bourg-eglise_ste_caliste-lambersart-img_3726.jpg", description: "Lomme est une ancienne commune française située dans le département du Nord et la région Hauts-de-France, associée à Lille depuis février 2000")
bois_blanc = District.create(name: "Bois-Blancs", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/bandeau-bois-blancs/2586156-2-fre-FR/bandeau-bois-blancs_page_banner_image_bannerview.png", description: "Le quartier émergent de Bois Blancs est traversé par le canal et la rivière Deûle, où des péniches colorées sont amarrées le long de quais post-industriels. Des pistes de jogging bordent les cours d'eau, appréciés des amateurs de kayak et de stand up paddle. Des immeubles d'habitation contemporains surplombent les jardins du parc EuraTechnologies, aménagé dans une ancienne usine textile en briques rouges. Des pizzerias et des pâtisseries d'angle parsèment les rues résidentielles de la zone.")
wazemmes = District.create(name: "Wazemmes", image: "https://lilleaddict.fr/wordpress/wp-content/uploads/2021/04/marche-lille.jpg", description: "Le quartier cosmopolite de Wazemmes se concentre autour des halles en briques rouges de Wazemmes, qui comprennent des étals vendant des fleurs, du miel et du fromage, ainsi qu'un marché aux puces dominical animé sur la place adjacente. Les ruelles sont bordées de maisons mitoyennes dont les rez-de-chaussée abritent des fast-foods asiatiques, des épiceries arabes et des cafés d'angle servant du couscous et du thé à la menthe. La Maison Folie, avec sa façade métallique futuriste, est un centre d'art qui propose concerts et ateliers pour enfants.")
lille_sud = District.create(name: "Lille-Sud", image: "https://lvdneng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2019/05/31/node_625972/40457393/public/2019/05/31/B9719766830Z.1_20190531143639_000%2BGJ5DO74TT.1-0.jpg?itok=dFGG8E7F1578430072", description: "Lille-Sud est un quartier en réhabilitation qui comprend de nouveaux complexes tels que le parc biotechnologique Eurasanté, le skatepark de la Halle de Glisse et des lotissements modernes remplaçant des structures industrielles. Les étudiants de médecine du centre hospitalier régional universitaire se rendent dans les bars et les brasseries autour de la rue du Faubourg des Postes, également bordée de boulangeries et de magasins halal. La place Edith-Cavell accueille un marché quotidien animé où sont vendus des tissus et des épices africaines.")
lille_moulins = District.create(name: "Lille-Moulins", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/bandeau-moulins/2586140-1-fre-FR/bandeau-moulins_page_banner_image_bannerview.jpg", description:"Le quartier post-industriel de Moulins est une enclave émergente avec des bars et des cafés avant-gardistes aménagés dans d'anciennes usines. Le pôle culturel Maison Folie Moulins propose des films et des pièces dans une brasserie en briques rouges du XIXe siècle, et le théâtre du Prato occupe une usine textile reconvertie. Une serre tropicale futuriste surplombe les parterres de fleurs raffinés du jardin botanique établi au XVIe siècle. Le complexe sportif moderniste Jean-Bouin accueille des matchs de volley-ball et des meetings d'athlétisme.")
faubourg_de_bethune = District.create(name: "Faubourg de Béthune", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/header-faubourg/2586214-1-fre-FR/header-faubourg_page_banner_image_bannerview.jpg", description: "Situé au sud du boulevard de Metz et traversé par des routes périphériques très fréquentées, le Faubourg de Béthune est connu pour ses rues résidentielles décorées de graffitis et ses immeubles élevés en cours de réhabilitation. Le parc rénové de Barbusse comprend des aires de jeux pour enfants verdoyantes, et le Jardin des sports est un complexe contemporain qui abrite des terrains de volley-ball, de football et de basket-ball. Des restaurants de burgers, des bars simples, des supermarchés et des chaînes de magasins parsèment la zone.")
hellemmes = District.create(name: "Hellemmes", image: "https://upload.wikimedia.org/wikipedia/commons/a/ae/Mairie_d%27_Hellemmes-Lille.jpg", description: "Hellemmes-Lille, généralement appelée Hellemmes (Hellem en flamand), est une ancienne commune française du département du Nord qui a le statut de commune associée depuis sa fusion avec Lille en avril 1977. Sa population s'élevait, en 2013, à 18 492 habitants")
vauban_esquermes = District.create(name: "Vauban-Esquermes", image: "https://images.unsplash.com/photo-1610064980867-ae10cf264e1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80", description: "Doté d'une importante communauté étudiante, le quartier animé de Vauban Esquermes est connu pour ses discothèques ouvertes tard dans la nuit, ses cafés branchés et ses bars d'angle communément appelés 'zincs'. En forme d'étoile, la Citadelle est un ancien ouvrage militaire du XVIIe siècle qui abrite le parc d'attractions Les Poussins et le zoo de Lille, avec ses oiseaux et ses reptiles. Les joggeurs, les cyclistes et les pique-niqueurs apprécient le jardin paysager de Vauban et les espaces verts du bois de Boulogne, au bord de la Deûle.")
saint_maurice_pellevoisin = District.create(name: "Saint-Maurice Pellevoisin", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/bandeau-st-maurice/2586152-1-fre-FR/bandeau-st-maurice_page_banner_image_bannerview.jpg", description: "Dans le quartier dynamique de Saint-Maurice Pellevoisin, les maisons médiévales en bois côtoient les villas majestueuses et leurs jardins clos de murs. La rue animée du Luxembourg est bordée de bureaux et de grands immeubles d'habitation contemporains. De nombreux jeunes professionnels internationaux se rendent dans les cafés avant-gardistes regroupés autour du parc verdoyant des Buissonnets et du jardin des Géants, tandis que la rue du Faubourg de Roubaix comprend des pizzerias et des restaurants branchés proposant une cuisine saine.")
lille_centre = District.create(name: "Lille-Centre", image: "https://www.voyageway.com/wp-content/uploads/2019/07/ou-dormir-a-lille-grand-place.jpg", description: "Bâties au XVIIe siècle, les maisons mitoyennes à pignon de l'élégant Lille-Centre entourent la Grand-Place pavée, avec ses nombreux cafés en plein air qui servent des boissons chaudes et du pastis. Les boulevards situés à proximité sont bordés de grands magasins et de boutiques. La gare rénovée de Lille-Saint-Sauveur accueille des concerts et des expositions d'art, et le théâtre du Nord propose des pièces et des spectacles humoristiques. Le palais des beaux-arts abrite des œuvres de maîtres européens, dont Raphaël et Rubens.")
vieux_lille = District.create(name: "Vieux-Lille", image: "http://blog.luckyloc.com/wp-content/uploads/2018/05/Vieux-Lille.jpg", description: "Le Vieux-Lille est un quartier situé au nord de Lille. C'est le quartier le plus riche en constructions antérieures au XIXᵉ siècle. Il conserve encore de nombreuses rues pavées et quelques traces des canaux qui sillonnaient la ville aux siècles passés. Il est peuplé par 20.000 habitants.")
fives = District.create(name: "Fives", image: "https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/actualites/images/juin-2019/bandeau-fives/2586148-1-fre-FR/bandeau-fives_page_banner_image_bannerview.jpg", description:"Le quartier éclectique et post-industriel de Fives fait l'objet d'une rénovation urbaine : ses habitations datant du début du XIXe siècle sont remplacées par des immeubles d'appartements contemporains entourés de places arborées. Les bâtiments en briques rouges de l'usine reconvertie de Fives Cail Babcock abritent aujourd'hui un lycée hôtelier. Les rues animées regorgent de restaurants thaïlandais, de cafés végétariens et de bars servant du pastis. Un marché alimentaire très fréquenté se tient chaque dimanche sur la place Pierre-Degeyter.")

# seeds Type

Type.destroy_all
vlille = Type.create(category: 'transport', name: 'vlille')
bus = Type.create(category: 'transport', name: 'bus')
metro = Type.create(category: 'transport', name: 'metro')

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
  # interest = Interest.new(address: @adresse, longitude: @longitude, latitude: @latitude, type: @vlille )
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

# seeds Interest : Santé => Vétérinaies

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

puts 'Finished!'
# Interest.create(adresse, )
