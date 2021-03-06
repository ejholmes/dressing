# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dressing/version'

Gem::Specification.new do |spec|
  spec.name          = 'dressing'
  spec.version       = Dressing::VERSION
  spec.authors       = ['Eric J. Holmes']
  spec.email         = ['eric@ejholmes.net']
  spec.description   = %q{A Capybara driver for Sauce Labs}
  spec.summary       = %q{A Capybara driver for Sauce Labs}
  spec.homepage      = 'https://github.com/ejholmes/dressing'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'selenium-webdriver'
  spec.add_dependency 'sauce_whisk'
  spec.add_dependency 'net-http-persistent'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'rake'
end
