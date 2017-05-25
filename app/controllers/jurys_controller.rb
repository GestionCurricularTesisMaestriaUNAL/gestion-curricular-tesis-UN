class JurysController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    #El 101 que se pasa como parametro es el id del user, puse 101 porque fue uno que cree manualmente.
    @gradeworks = Gradework.users_gradework(101)
	#La línea comentada debería funcionar con el LDAP
	# @gradeworks = Gradework.users_gradework(current_user.id)
	
    @gradework = Gradework.new
    @feedbacks = Feedback.all
    #@jury_id = Gradework.users_jury_id() 
    @grad_jury = Gradework.users_gradework(current_user.id)#El paremtro es el id del usuario actual.....


  end

  def new
    @gradework = Gradework.new
  end
  
  def home
    #El 101 que se pasa como parametro es el id del user, puse 101 porque fue uno que cree manualmente.
    @gradeworks = Gradework.users_gradework(101)
	#La línea comentada debería funcionar con el LDAP
	# @gradeworks = Gradework.users_gradework(current_user.id)
  end
end
