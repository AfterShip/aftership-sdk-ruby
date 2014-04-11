# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'aftership'
  s.version = '3.0.0'
  s.licenses = ['MIT']
  s.summary = 'Formerly known as aftership_ruby and a wrapper for AfterShip API. Support the latest V3 API'
  s.description = 'Developed for easy integration with AfterShip'
  s.required_ruby_version = '>= 1.8.7'

  s.author = 'AfterShip.com'
  s.email = 'support@aftership.com'
  s.homepage = 'https://www.aftership.com'

  s.files         = ["lib/aftership.rb", "lib/aftership/base.rb", "lib/aftership/courier.rb", "lib/aftership/tracking.rb", "lib/aftership/last_checkpoint.rb"]
  s.require_paths = ['lib']
  s.requirements << 'none'

  s.add_dependency 'httpi', '~> 2.1'
end