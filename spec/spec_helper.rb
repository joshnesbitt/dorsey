require 'rspec'
require 'rack/test'
require_relative '../app'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  MainApplication.new
end
