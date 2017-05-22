module Enrollment
  module Ability
    def is_admin?
      #current_user == User.first ? true : false
      true
    end
  end
end

Enrollment.setup do |config|
  #if you use devise, this will work correctly
  #write down your devise user model name!
  config.user_model_name = "user"

  #write down main column name to use it as "username"!
  config.user_model_main_column = "email"

  # if this is true, all page needed to be signed in
  config.user_only_accessible = false

  #root url for engine
  config.root_url = "/enrollment"

  #if you don't want to use default route as /attendence, change as false
  #you can bind route like [get 'my/route' => 'rock_scissors_paper/home#index'] in routes.rb
  config.automatic_routes_mount = true

end
