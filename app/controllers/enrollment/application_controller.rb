module Enrollment
  class ApplicationController < ActionController::Base
    if Enrollment.user_only_accessible
      before_action :authenticate_user!
    end
    protect_from_forgery with: :exception
    include ApplicationHelper
  end
end
