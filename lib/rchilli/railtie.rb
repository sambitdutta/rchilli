module Rchilli
  
  class Railtie < ::Rails::Railtie
  
    generators do
      load "generators/rchilli/install_generator.rb"
    end
    
  end
  
end