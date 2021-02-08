Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'aftership'
  s.version = '4.5.0'
  s.licenses = ['MIT']
  s.summary = 'Formerly known as aftership_ruby and a wrapper for AfterShip API. Support the latest V3/V4 API'
  s.description = 'Developed for easy integration with AfterShip'
  s.required_ruby_version = '>= 2.3.0'

  s.author = ['AfterShip Limited']
  s.email = ['support@aftership.com']
  s.homepage = 'https://www.aftership.com'

  s.files         = Dir['{bin,lib}/**/*', 'README.md']
  s.require_paths = ['lib']
  s.requirements << 'none'

  s.add_dependency 'faraday', '~> 1.0.1'
  s.add_dependency 'faraday_middleware', '~> 1.0.0'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec', '~> 2.14.1'
end
