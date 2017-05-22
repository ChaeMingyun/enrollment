require "rails"

module Enrollment
  mattr_accessor :user_model_name
  @@user_model_name = 'user'

  mattr_accessor :user_model_main_column
  @@user_model_main_column = "email"

  # if this is true, all page needed to be signed in
  mattr_accessor :user_only_accessible
  @@user_only_accessible = false

  mattr_accessor :root_url
  @@root_url = "/enrollment"

  # automatic engine routes mouting
  mattr_accessor :automatic_routes_mount
  @@automatic_routes_mount = true

  def self.setup
    yield self
  end

end

require "enrollment/extentions"

require "enrollment/version"
require "enrollment/engine"
require_relative "rails/routes"
