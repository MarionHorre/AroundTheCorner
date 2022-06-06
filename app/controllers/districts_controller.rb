class DistrictsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index

    # on récupère les params
    @district_params = session[:params]


    # crée une hash par catégorie disposant des params du form
    transports = session[:params]["transport"]
    vie_quotidienne = session[:params]["vie quotidienne"]
    hobbies = session[:params]["hobbies"]
    sante = session[:params]["santé"]

    params_array = [transports, vie_quotidienne, hobbies, sante]

    # autre idée
    # on itère sur chaque key/value des params
    # si true on

    districts = District.all
    # on va itéré sur chaque district

    quartier_value = 0
    raise
    # each_with_index pour itérer avec l'index de la array ?

    districts.each do |district|
      # on itère sur chaque type d'un district
      district.types.each do |type|
        # si category == true dans le form => ajoute 1 à la valeur du quartier sinon 0
        type.name == transports.each_value { |value| p value } ? quartier_value += 1 : "0"
        # raise
      end
    end


    p "this is the district value #{quartier_value}"
    @top_3_districts = District.first(3)
    # raise
    # @districts = District.first(3)

  end

  # def search_flat
  #   @params = params
  # end

end
