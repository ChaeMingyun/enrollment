module Enrollment
  module Authenticate
    def en_current_user
      send('current_'+ Enrollment.user_model_name)
    end

    def en_authenticate_user!
      send('authenticate_'+ Enrollment.user_model_name+'!')
    end

    def en_user
      Enrollment.user_model_name.capitalize.constantize
    end

    def en_find_user(user_id)
      col_name = Enrollment.user_model_main_column
      en_user.find(user_id)[col_name]
    end
  end
end
