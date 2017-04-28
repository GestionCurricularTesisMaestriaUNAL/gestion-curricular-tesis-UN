class JurysController < ApplicationController
  
  def index
    @gradeworks = Gradework.all
    @juries = User.users_jury
  end

  def new
    @gradework = Gradework.new
  end
  
  def home
    @gradeworks = Gradework.all
  end
end
