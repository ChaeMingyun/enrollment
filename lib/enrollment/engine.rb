module Enrollment
  class Engine < ::Rails::Engine
    isolate_namespace Enrollment
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'any_login.assets_precompile', :group => :all do |app|
      app.config.assets.precompile += ['enrollment/*']
    end
  end
end
