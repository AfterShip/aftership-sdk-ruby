# encoding: utf-8

require 'rubygems'
require 'bundler/setup'
require File.expand_path(File.join(File.dirname(__FILE__), '../lib/aftership'))
require 'pry'
require 'coveralls'

Bundler.setup
Coveralls.wear!

RSpec.configure do |config|
  # some (optional) config here
end
