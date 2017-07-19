module Rchilli
  class Client
    
    def self.track(tracking_number, dhl_id, dhl_password)
      require 'dhl_memnosyne/web_interface/dhl_call'
      DhlCall.response(tracking_number, dhl_id, dhl_password)
    end
    
  end
end