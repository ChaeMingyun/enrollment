require "rails"

module Enrollment
  # automatic engine routes mouting
  mattr_accessor :automatic_routes_mount
  @@automatic_routes_mount = true

  # Default way to set up Devise. Run rails generate devise_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

end

require "enrollment/version"
require "enrollment/engine"
require_relative "rails/routes"
