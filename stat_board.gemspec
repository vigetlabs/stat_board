$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stat_board/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stat_board"
  s.version     = StatBoard::VERSION
  s.authors     = ["David Eisinger"]
  s.email       = ["david.eisinger@viget.com"]
  s.homepage    = "https://github.com/vigetlabs/stat_board"
  s.summary     = "Simple dashboard of records created this week, this month, and all time, mountable as a Rails Engine."
  s.description = "Simple dashboard of records created this week, this month, and all time, mountable as a Rails Engine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "highcharts-rails", "~> 3.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "pry"
  s.add_development_dependency "launchy"
  s.add_development_dependency "capybara",         "~> 1.1.4"
  s.add_development_dependency "capybara-webkit",  "~> 0.13.0"
  s.add_development_dependency "database_cleaner", "~> 0.9.1"
end
