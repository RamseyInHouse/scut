require 'compass'

base_directory  = File.join(File.dirname(__FILE__), '..')
stylesheets_dir = File.join(base_directory, 'dist')
Compass::Frameworks.register('Scut', :stylesheets_directory => stylesheets_dir)

module Scut
  VERSION = "1.1.3"
  DATE = "2015-05-06"
end