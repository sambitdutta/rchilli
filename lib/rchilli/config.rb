require 'yaml'
require 'erb'

module Rchilli
  
  module Config
    
    extend self
    
    def user_configuration
      begin
        path = File.join(::Rails.root, 'config', 'rchilli.yml')
        if File.exist?(path)
          File.open(path) do |file|
            processed = ERB.new(file.read).result
            YAML.load(processed)[::Rails.env]
          end
        else
          {}
        end
      end
    end

    
  end
  
end
