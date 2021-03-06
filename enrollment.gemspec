$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enrollment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enrollment"
  s.version     = Enrollment::VERSION
  s.authors     = ["ChaeMinGyun"]
  s.email       = ["coalsrbs7@gmail.com"]
  s.homepage    = "https://github.com/ChaeMingyun/enrollment"
  s.summary     = "useful gem for making enrollment page and shopping page"
  s.description = "support useful api, methods and complete default page"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.2"

  s.add_development_dependency "sqlite3"
end
