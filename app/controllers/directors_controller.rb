class DirectorsController < ApplicationController
  def index
	#El 101 que se pasa como parametro es el id del user, puse 101 porque fue uno que cree manualmente.
    @gradeworks = Gradework.users_gradework(101)
	#La línea comentada debería funcionar con el LDAP
	# @gradeworks = Gradework.users_gradework(current_user.id)
    @grad_director = Gradework.users_gradework(51)
  end
  
  def home
	#El 101 que se pasa como parametro es el id del user, puse 101 porque fue uno que cree manualmente.
    @gradeworks = Gradework.users_gradework(101)
	#La línea comentada debería funcionar con el LDAP
	# @gradeworks = Gradework.users_gradework(current_user.id)
  end
  
end
