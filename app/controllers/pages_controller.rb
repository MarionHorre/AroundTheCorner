class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search_form, :recap, :test_component ]

  def home
  end

  def search_form
    session[:user] = SecureRandom.base58 #Generate a token key for the user without altering the DB
  end

  def recap
    @params = params
  end

  def test_component
  end

end
