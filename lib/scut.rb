require 'compass'

base_directory  = File.join(File.dirname(__FILE__), '..')
stylesheets_dir = File.join(base_directory, 'dist')
Compass::Frameworks.register('Scut', :stylesheets_directory => stylesheets_dir)

module Scut
  VERSION = "0.7.2"
  DATE = "2013-12-08"
end