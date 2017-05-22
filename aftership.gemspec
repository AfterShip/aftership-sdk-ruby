$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'aftership/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'aftership'
  s.version = AfterShip::VERSION
  s.licenses = ['MIT']
  s.summary = 'Formerly known as aftership_ruby and a wrapper for AfterShip API. Support the latest V3/V4 API'
  s.description = 'Developed for easy integration with AfterShip'
  s.required_ruby_version = '>= 1.8.7'

  s.author = ['AfterShip Limited']
  s.email = ['support@aftership.com']
  s.homepage = 'https://www.aftership.com'

  s.files         = Dir['{bin,lib}/**/*', 'README.md']
  s.require_paths = ['lib']
  s.requirements << 'none'

  s.add_dependency 'httpclient', '~> 2.7.1'

  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'pry'
end
