class HomeController < ApplicationController

    def home
      @grad_jury = Gradework.users_gradework(current_user.id)
      @cUser = current_user
      user = current_user
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
          jury_index
        else
          # Unknown user type? Render error or use a default.
      end
    end

    protected
    def jury_index
      # ...
      render '/jurys/index'
      @grad_jury = Gradework.users_gradework(101)
    end

    def student_home
      # ...
      render '/students/index'
    end

    def director_home
      # ...
      render '/directors/index'
    end

    def admin_home
      # ...
      render '/administrator/home'
    end

end
