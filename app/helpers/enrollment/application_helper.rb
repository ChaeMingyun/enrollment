module Enrollment
  module ApplicationHelper
    include Enrollment::Ability
    include Enrollment::Authenticate
  end
end
