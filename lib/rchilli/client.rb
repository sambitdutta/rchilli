require 'rchilli/config'

module Rchilli
  
  class ParseError < StandardError; end
  
  class Client
    
    include Singleton
    
    PATH = "http://globallogic.rchilli.com/RChilliParser/services/RChilliParser?wsdl"
    
    def initialize
      @client = Savon.client(:wsdl => PATH, :namespace => "rch")
    end
    
    def method_missing(method, *args)
      result = @client.send(method, *args)
      if result.success?
        result
      else
        raise Rchilli::ParseError, "unable to parse"
      end
    end
    
    def self.parse_resume_binary(binary_content, file_name)
      userkey, version, sub_user_id = Rchilli::Config.user_configuration['user_key'], Rchilli::Config.user_configuration['version'], Rchilli::Config.user_configuration['sub_user_id']
      begin
        result = self.instance.call(:parse_resume_binary, message: { filedata: binary_content, file_name: file_name, userkey: userkey, version: version, sub_user_id: sub_user_id })
      rescue
      else
        result = result.body[:parse_resume_binary_response][:return]
      end
      result
    end
    
  end
end