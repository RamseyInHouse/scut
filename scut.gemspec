require './lib/scut'

Gem::Specification.new do |s|
  s.version = Scut::VERSION
  s.date = Scut::DATE

  # Gem Details
  s.name = "scut"
  s.rubyforge_project = "scut"
  s.description = %q{A collection of Sass utilities to ease and improve our implementations of common style-code patterns.}
  s.summary = %q{Sass utilities for the frontend laborer.}
  s.authors = ["David Clark"]
  s.email = ["david.dave.clark@gmail.com"]
  s.homepage = "http://davidtheclark.github.io/scut/"
  s.license = 'MIT'

  # Library Files
  s.files = Dir.glob("lib/**/*.*")

  # Sass Files
  s.files += Dir.glob("dist/*.*")

  # Gems Dependencies
  s.add_runtime_dependency 'sass', '~> 3.2', '>= 3.2.0'
end