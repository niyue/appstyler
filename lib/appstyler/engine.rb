require 'rails'
require 'appstyler'

module Appstyler
  class Engine < Rails::Engine
    engine_name :appstyler
    config.asset_path = '%s'
  end
end
