$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'nav/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'nav'
  s.version     = Nav::VERSION
  s.authors     = ['Jiri Kolarik']
  s.email       = ['jiri.kolarik@imin.cz']
  s.homepage    = 'http://werein.cz'
  s.summary     = 'Navigation for Rails'
  s.description = 'Navigation for Rails'

  s.files       = Dir['{app,config,db,lib}/**/*', 'License.txt', 'Rakefile', 'Readme.md']
  s.test_files  = Dir['test/*.*' ,'test/{cells,controllers,data,helpers,integration,models}/**/*','test/dummy/*.*', 'test/dummy/{app,bin,config,db,lib}/**/*']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'ancestry'
  s.add_dependency 'enumerize'
  s.add_dependency 'cells'

  s.add_development_dependency 'tuberack', '~> 1.0.3'
end
