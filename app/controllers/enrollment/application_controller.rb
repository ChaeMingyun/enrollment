module Enrollment
  class ApplicationController < ActionController::Base
    if Enrollment.user_only_accessable
      before_action :authenticate_user!
    end
    protect_from_forgery with: :exception
    include ApplicationHelper
  end
end
