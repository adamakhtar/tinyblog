$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tinyblog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tinyblog"
  s.version     = Tinyblog::VERSION
  s.authors     = ["Adam Akhtar"]
  s.email       = ["adamsubscribe@googlemail.com"]
  s.homepage    = "http://www.github.com/robodisco/tinyblog"
  s.summary     = "A tiny blog that just works."
  s.description = "Edit posts with live markdown and drag and drop images."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency 'carrierwave'
  s.add_dependency 'friendly_id', '5.0.3'
  s.add_dependency 'redcarpet', '3.1.1'
  s.add_dependency 'simple_form'
  s.add_dependency 'paranoia', '~> 2.0'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', '2.14.1'
  s.add_development_dependency 'capybara', '2.1.0'
  s.add_development_dependency 'devise', '3.1.0'  
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'factory_girl', '4.1.0'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'better_errors'
  s.add_development_dependency 'binding_of_caller'
  s.add_development_dependency 'bootstrap-sass'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sprockets', '2.11.0' # explicily add sprockets to lock to this version to fix undefined method 'enviromnet' bug
  
end

