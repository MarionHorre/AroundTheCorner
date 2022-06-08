class DistrictsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    #session[:priority] = params
    # on récupère les params
    @district_params = session[:params]

    # crée une hash par catégorie disposant des params du form
    transports = session[:params]["transport"]
    vie_quotidienne = session[:params]["vie quotidienne"]
    hobbies = session[:params]["hobbies"]
    sante = session[:params]["santé"]

    # on va itéré sur chaque district
    districts = District.all

    districts_points = []

    districts.each do |district|
      # on itère sur chaque type d'un district
      district_value = 0
      district.types.each do |type|
        # si category == true dans le form => ajoute 1 à la valeur du quartier sinon 0
        # on compare le type.name aux params données par le visiteur
        transports.nil? ? "" : ( transports.key?(type.name) ? district_value += 1 : "")
        vie_quotidienne.nil? ? "" : ( vie_quotidienne.key?(type.name) ? district_value += 1 : "")
        hobbies.nil? ? "" : ( hobbies.key?(type.name) ? district_value += 1 : "")
        sante.nil? ? "" : ( sante.key?(type.name) ? district_value += 1 : "" )
      end
      districts_points << [district_value, district.name]
    end

    top_three_districts_sorted_reversed = districts_points.sort!.last(3).reverse

    district_instances = []

    top_three_districts_sorted_reversed.each do |name|
      district_instances << District.find_by(name: name[1].to_s)
    end

    @top_3_districts = district_instances
  end

  # def search_flat
  #   @params = params
  # end

end
