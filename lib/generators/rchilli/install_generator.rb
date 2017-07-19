require 'rails/generators'

module Rchilli
  class InstallGenerator < ::Rails::Generators::Base
    
    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def copy_config_file
      template 'config/rchilli.yml'
    end

  end
end