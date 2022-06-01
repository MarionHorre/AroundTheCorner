class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :test, :tester ]

  def home
  end

  def test
    session[:user] = SecureRandom.base58 #Generate a token key for the user
  end

  def tester
    @params = params
    raise
  end

  def recap
  end

end
