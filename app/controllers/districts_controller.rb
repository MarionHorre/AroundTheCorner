class DistrictsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index

    # on récupère les params
    @district_params = session[:params]


    @districts = District.where(@district_params["transport"])
    # @districts = District.first(3)

    raise
  end

  # def search_flat
  #   @params = params
  # end

end
