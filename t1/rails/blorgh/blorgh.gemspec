$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "blorgh/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blorgh"
  s.version     = Blorgh::VERSION
  s.authors     = ["Mauricio Fierro"]
  s.email       = ["mauriciofierrom@gmail.com"]
  s.homepage    = "http://mauriciofierrom.github.io"
  s.summary     = "Summary"
  s.description = "Description of Blorgh."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
