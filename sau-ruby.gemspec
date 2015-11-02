require_relative 'lib/sau/version'

Gem::Specification.new do |gem|
  gem.name = 'sau-ruby'
  gem.version = SAU::VERSION
  gem.date = Date.today.to_s
  gem.summary = 'Ruby wrapper for the Sea Around Us API'
  gem.authors = ['Robert Scott Reis']
  gem.add_dependency('rest-client', ['~> 1.8'])
  gem.add_development_dependency 'rspec', ['~> 3.3']
  gem.add_development_dependency 'webmock', ['~> 1.21']
  gem.license = 'AGPL-3.0'
  gem.required_ruby_version = '~> 2.1'
  gem.files = Dir[ 'README.md', 'LICENSE', '{lib,spec}/**/*' ]
  gem.homepage = 'https://github.com/seaaroundus/sau-ruby'
end
