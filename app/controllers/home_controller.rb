class HomeController < ApplicationController

    def home

<<<<<<< Updated upstream
      #p idGrade_url
      @currentgradeworks = current_user.gradeworks
=======
      @gradework_id= params[:idGrade]
>>>>>>> Stashed changes
      @gradeworks = Gradework.all
      user = current_user
      @grad_jury = Gradework.users_gradework(current_user.id)
      @cUser = current_user.id
      #@feedUser = Feedback.feedback_user(current_user.id)
      @feedUser = User.users_by_id(current_user.id)
      @feedbacks = Feedback.all
      
      #us = User.find(user.id)
      p user.roles
      case
        when user.roles.where({ roles: { name: "Student" } }).any?
          student_home 
        when user.roles.where({ roles: { name: "Administrator" } }).any?
          admin_home
        when user.roles.where({ roles: { name: "Director" } }).any?
          admin_home
        when user.roles.where({ roles: { name: "Jury" } }).any?
          jury_home
        else
          # Unknown user type? Render error or use a default.
      end
    end

    protected
    def jury_home
      # ...
      render '/jurys/index'
    end

    def student_home
      # ...

      render '/students/index'
    end

    def director_home
      # ...
      render '/directors/home'
    end

    def admin_home
      # ...
      render '/administrator/home'
    end

end


