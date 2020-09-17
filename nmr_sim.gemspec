$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nmr_sim/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nmr_sim"
  s.version     = NmrSim::VERSION
  s.authors     = ["jasonych99"]
  s.email       = ["jasonych99@gmail.com"]
  s.homepage    = "https://github.com/ComPlat/nmr_sim"
  s.summary     = "Engine and React components of NMR simulation."
  s.description = "You can get NMR simulation data using API to request 3rd party websites. React components has reference to those websites."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = "~> 2.1"
  s.add_dependency "rails", "~> 4.2"

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rspec", "~> 3.4"
  s.add_development_dependency "webmock", "~> 2.1"
  s.add_development_dependency "sqlite3"
end
