class DistrictsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    # session[:user] = SecureRandom.base58 #Generate a token key for the user without altering the DB

    # on récupère les params
    @district_params = session[:params]
    @districts = District.first(3)
  end

  # def search_flat
  #   @params = params
  # end

end
