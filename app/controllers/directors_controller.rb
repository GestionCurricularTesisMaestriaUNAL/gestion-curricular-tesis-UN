class DirectorsController < ApplicationController
  def index
    @gradeworks = Gradework.all
    @grad_director = Gradework.users_gradework(51)
  end
  
  def home
    @gradeworks = Gradework.all
  end
  
end
