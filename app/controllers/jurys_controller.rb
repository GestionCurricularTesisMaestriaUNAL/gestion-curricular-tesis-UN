class JurysController < ApplicationController
  
  def index
    @gradeworks = Gradework.all
    @gradework = Gradework.new
    @feedbacks = Feedback.all
    @grad_jury = @gradework.users.joins(:roles).where(roles: {name: "Jury"})

  end

  def new
    @gradework = Gradework.new
  end
  
  def home
    @gradeworks = Gradework.all
  end
end
