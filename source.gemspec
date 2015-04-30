# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phone_validator/version'

Gem::Specification.new do |spec|
  spec.name          = 'etude2-rails'
  spec.version       = PhoneValidator::VERSION
  spec.authors       = ['Tin Htoo Aung [3806341]']
  spec.email         = ['tin22413@student.otago.ac.nz']

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  end

  spec.summary       = 'Format and validate telephone numbers'
  spec.description   = 'Format and validate telephone numbers'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/etude2}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
