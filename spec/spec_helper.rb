$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simulation/nmrdb'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # config
end
