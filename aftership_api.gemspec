# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'aftership_api'
  s.version = '1.0.0'
  s.summary = 'AfterShip open APIs'
  s.description = 'used for ruby developers to integrate with AfterShip'
  s.required_ruby_version = '>= 1.8.7'

  s.author = 'LU Wenlong'
  s.email = 'wllu@aftership.com'
  s.homepage = 'http://www.aftership.com'

  s.files         = ["lib/aftership_api.rb", "lib/aftership_api/base.rb", "lib/aftership_api/courier.rb", "lib/aftership_api/tracking.rb"]
  s.require_paths = ['lib']
  s.requirements << 'none'

  s.add_dependency 'httpi'

  # s.add_development_dependency 'factory_girl'
end