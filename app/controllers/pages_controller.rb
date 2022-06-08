class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search_form, :recap ]

  def home
    session[:user] = SecureRandom.base58 #Generate a token key for the user without altering the DB
    @metros = Interest.where(type_id: 3)

    @markers = @metros.geocoded.map do |metro|
      {
        lat: metro.latitude,
        lng: metro.longitude

        # info_window: render_to_string(partial: "info_window", locals: { metro: metro })
      }
    end
  end

  # def search_form
  #   session[:user] = SecureRandom.base58 #Generate a token key for the user without altering the DB
  # end

  def recap
    @params = params
    session[:params] = @params
  end
end
