$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_builders/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_builders"
  s.version     = BootstrapBuilders::VERSION
  s.authors     = ["kaspernj"]
  s.email       = ["kaspernj@gmail.com"]
  s.homepage    = "https://github.com/kaspernj/bootstrap_builders"
  s.summary     = "A library to generate Bootstrap HTML for Rails."
  s.description = "A library to generate Bootstrap HTML for Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "coffee-rails", ">= 4.0.0"
  s.add_dependency "html_gen", ">= 0.0.13"
end
