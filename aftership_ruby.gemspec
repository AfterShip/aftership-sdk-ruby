# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'aftership_ruby'
  s.version = '1.0.1'
  s.summary = 'Wrapper for AfterShip API'
  s.description = 'Developed for easy integration with AfterShip'
  s.required_ruby_version = '>= 1.8.7'

  s.author = 'LU Wenlong'
  s.email = 'wllu@aftership.com'
  s.homepage = 'http://www.aftership.com'

  s.files         = ["lib/aftership_api.rb", "lib/aftership_api/base.rb", "lib/aftership_api/courier.rb", "lib/aftership_api/tracking.rb"]
  s.require_paths = ['lib']
  s.requirements << 'none'

  s.add_dependency 'httpi'
end