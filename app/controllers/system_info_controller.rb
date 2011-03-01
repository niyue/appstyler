class SystemInfoController < ApplicationController
  def index
    @ruby_version = "#{RUBY_VERSION} (#{RUBY_PLATFORM})"
    @rubygems_version = Gem::RubyGemsVersion
    @rails_version = Rails::VERSION::STRING
    @app_root = File.expand_path(Rails.root)
    @db_schema_version = ActiveRecord::Migrator.current_version rescue nil
    @dependencies = Bundler.load.specs.map { |spec| [spec.name, spec.version.version] }
  end
end
