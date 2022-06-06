class DistrictsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @districts = District.first(3)
  end

  # def search_flat
  #   @params = params
  # end

end
