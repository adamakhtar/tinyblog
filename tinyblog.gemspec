$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tinyblog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tinyblog"
  s.version     = Tinyblog::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Tinyblog."
  s.description = "TODO: Description of Tinyblog."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency 'simple_form'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', '2.14.1'
  s.add_development_dependency 'capybara', '2.1.0'
  s.add_development_dependency 'devise', '3.1.0'  
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'factory_girl', '4.1.0'
  s.add_development_dependency 'pry'
end

