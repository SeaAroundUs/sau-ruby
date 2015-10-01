require_relative 'lib/sau/version'

Gem::Specification.new do |gem|
  gem.name = 'sau-ruby'
  gem.version = SAU::VERSION
  gem.date = Date.today.to_s
  gem.summary = 'Ruby wrapper for the Sea Around Us API'
  gem.authors = ['Robert Scott Reis']
  gem.add_dependency('rest-client', ['~> 1.8'])
  gem.license = 'SEE LICENSE IN LICENSE'
  gem.required_ruby_version = '~> 2.1'
  gem.files = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*'
  ]
end