# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'aftership'
  s.version = '1.0.3'
  s.summary = 'Formerly known as aftership_ruby and a wrapper for AfterShip API'
  s.description = 'Developed for easy integration with AfterShip'
  s.required_ruby_version = '>= 1.8.7'

  s.author = 'LU Wenlong'
  s.email = 'wllu@aftership.com'
  s.homepage = 'http://www.aftership.com'

  s.files         = ["lib/aftership.rb", "lib/aftership/base.rb", "lib/aftership/courier.rb", "lib/aftership/tracking.rb"]
  s.require_paths = ['lib']
  s.requirements << 'none'

  s.add_dependency 'httpi'
end