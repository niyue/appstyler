$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'helpers'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
$:.unshift File.expand_path("../../lib", __FILE__)

require 'rubygems'
require 'bundler'
require 'action_controller'
require 'action_view'
require 'appstyler'
require 'application_helper'
ActionView::Base.send(:include, ::ApplicationHelper)

require 'action_controller/test_case'
require 'action_view/template'
require 'action_view/test_case'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda'


class Test::Unit::TestCase
end


class ActionView::TestCase
  
  # Take care of the RuntimeError:
  # In order to use #url_for, you must include routing helpers explicitly.
  # For instance, `include Rails.application.routes.url_helpers
  setup :shhhhhh_url_helpers
  
  def shhhhhh_url_helpers
    def @controller._routes
      Module.new do
        def self.url_helpers
          Module.new
        end
      end
    end
  end
  
  include ApplicationHelper
end
