class JurysController < ApplicationController
  
  def index
    @gradeworks = Gradework.all
    @gradework = Gradework.new
    @feedbacks = Feedback.all
    #@jury_id = Gradework.users_jury_id() 
    @grad_jury = Gradework.users_gradework(101)#El paremtro es el id del usuario actual.....


  end

  def new
    @gradework = Gradework.new
  end
  
  def home
    @gradeworks = Gradework.all
  end
end
