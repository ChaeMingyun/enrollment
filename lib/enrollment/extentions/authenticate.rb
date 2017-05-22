module Enrollment
  module Authenticate
    def current_user
      send('current_'+ Enrollment.user_model_name)
    end

    def authenticate_user!
      send('authenticate_'+ Enrollment.user_model_name+'!')
    end

    def user
      Enrollment.user_model_name.capitalize.constantize
    end
  end
end
