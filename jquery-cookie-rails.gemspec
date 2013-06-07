# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|

  # Variables
  s.name        = 'jquery-cookie-rails'
  s.author      = 'Ryan Scott Lewis'
  s.email       = 'ryan@rynet.us'
  s.summary     = 'Use jquery-cookie with Rails 3'
  s.description = 'This gem provides jquery-cookie assets for your Rails 3 application.'
  s.license     = 'MIT'

  # Dependencies
  s.add_dependency 'railties', '>= 3.2.0', '< 5.0'
  s.add_development_dependency 'rails',        '~> 3.2'
  s.add_development_dependency 'sqlite3',      '~> 1.3'
  s.add_development_dependency 'uglifier',     '~> 1.3'
  s.add_development_dependency 'sass',         '~> 3.2'
  s.add_development_dependency 'rake',         '~> 10.0'
  s.add_development_dependency 'fancy_logger', '~> 0.1'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'fuubar',       '~> 1.1'
  s.required_rubygems_version = ">= 1.3.6"

  # Pragmatically set variables
  s.homepage = "http://github.com/RyanScottLewis/#{s.name}"
  s.version = Pathname.glob('VERSION*').first.read rescue '0.0.0'
  s.require_paths = ['lib']
  s.files = %w(Gemfile jquery-cookie-rails.gemspec LICENSE Rakefile README.md VERSION vendor/assets/javascripts/jquery.cookie.js)
  s.files += Dir.glob('lib/*.rb')
  s.files += Dir.glob('lib/jquery-cookie-rails/**/*.rb')
  s.files += Dir.glob('spec/**/*')
end
