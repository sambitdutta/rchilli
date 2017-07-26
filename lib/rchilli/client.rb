require 'rchilli/config'

module Rchilli
  
  class ParseError < StandardError; end
  
  class Client
    
    include Singleton
    
    PATH = "http://socialdata.rchilli.com/RChilliParser/services/RChilliParser?wsdl"
    
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
    
    def self.process_resume(binary_content, file_name)
      begin
        userkey, version, sub_user_id = Rchilli::Config.user_configuration['user_key'], Rchilli::Config.user_configuration['version'], Rchilli::Config.user_configuration['sub_user_id']
        post_after_days, post_till_days, update_record, webhook_url = Rchilli::Config.user_configuration['details']['post_after_days'], Rchilli::Config.user_configuration['details']['post_till_days'], Rchilli::Config.user_configuration['details']['update_record'], Rchilli::Config.user_configuration['details']['webhook_url']

        result = self.instance.call(:process_resume, message: { "base64Data" => binary_content, "fileName" => file_name, "userKey" => userkey, "version" => version, "subUserId" => sub_user_id, "settingVariables" => "PostAfterDays:#{post_after_days};PostTillDays:#{post_till_days};UpdateRecord:#{update_record};WebhookUrl:#{webhook_url}" })
      rescue => e
        raise Rchilli::ParseError, e.message
      else
        result = result.body[:process_resume_response][:return]
        result = Hash.from_xml result

        raise Rchilli::ParseError, "(#{result["error"]["errorcode"]}) #{result["error"]["errormsg"]}".squish  if result.has_key? "error"
      end
      result
    end

    def self.deactivate_resume(resume_id)
      begin
        userkey, version, sub_user_id = Rchilli::Config.user_configuration['user_key'], Rchilli::Config.user_configuration['version'], Rchilli::Config.user_configuration['sub_user_id']

        result = self.instance.call(:deactivate_resume, message: { "resumeId" => resume_id, "userKey" => userkey, "version" => version, "subUserId" => sub_user_id })
      rescue => e
        raise Rchilli::ParseError, e.message
      else
        result = result.body[:deactivate_resume_response][:return]
        result = Hash.from_xml result
      end
      result
    end
    
  end
end