$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nmr_sim/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nmr_sim"
  s.version     = NmrSim::VERSION
  s.authors     = ["jasonych99"]
  s.email       = ["jasonych99@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of NmrSim."
  s.description = "TODO: Description of NmrSim."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.7.1"

  s.add_development_dependency "sqlite3"
end
