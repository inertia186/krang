# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'krang/version'

Gem::Specification.new do |spec|
  spec.name = 'krang'
  spec.version = Krang::VERSION
  spec.authors = ['Anthony Martin']
  spec.email = ['krang@martin-studio.com']

  spec.summary = %q{Bot framework for STEEM.}
  spec.description = %q{That frames your work.}
  spec.homepage = 'https://github.com/inertia186/krang'
  spec.license = 'CC0 1.0'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 12.0', '>= 12.0.0'
  spec.add_development_dependency 'minitest', '~> 5.10', '>= 5.10.2'
  spec.add_development_dependency 'minitest-line', '~> 0.6', '>= 0.6.4'
  spec.add_development_dependency 'minitest-proveit', '~> 1.0', '>= 1.0.0'
  spec.add_development_dependency 'webmock', '~> 3.0', '>= 3.0.1'
  spec.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.3'
  spec.add_development_dependency 'faraday', '~> 0.12', '>= 0.12.1'
  spec.add_development_dependency 'typhoeus', '~> 1.1', '>= 1.1.2'
  spec.add_development_dependency 'simplecov', '~> 0.10', '>= 0.10.1'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.5.2'
  spec.add_development_dependency 'yard', '~> 0.9', '>= 0.9.9'
  spec.add_development_dependency 'byebug', '~> 9.0', '>= 9.0.6'
  spec.add_development_dependency 'pry', '~> 0.10', '>= 0.10.4'
  spec.add_development_dependency 'delorean', '~> 2.1', '>= 2.1.0'

  spec.add_dependency 'radiator', '~> 0.2', '>= 0.2.3a'
  spec.add_dependency 'awesome_print', '~> 1.8', '>= 1.8.0'
end
