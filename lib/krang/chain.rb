module Krang
  require 'krang/utils'
  
  module Chain
    include Utils
    
    def reset_api
      @api = nil
    end
    
    def backoff
      Random.rand(3..20)
    end
    
    def api
      with_api
    end
    
    def with_api(&block)
      loop do
        @api ||= Radiator::Api.new(chain_options)
        
        return @api if block.nil?
        
        begin
          yield @api
          break
        rescue => e
          krang_warning "API exception, retrying (#{e})", e
          reset_api
          sleep backoff
          redo
        end
      end
    end
    
    def reset_properties
      @properties = nil
      @latest_properties = nil
    end
    
    def properties
      if !@latest_properties.nil? && Time.now - @latest_properties > 30
        @properties = nil
        @latest_properties = nil
      end
      
      return @properties unless @properties.nil?
      
      response = nil
      with_api { |api| response = api.get_dynamic_global_properties }
      response.result.tap do |properties|
        @latest_properties = Time.parse(properties.time + 'Z')
        @properties = properties
      end
    end
    
    def block_time
      Time.parse(properties.time + 'Z')
    end
    
    def find_comment(author, permlink)
      response = nil
      with_api { |api| response = api.get_content(author, permlink) }
      comment = response.result
      
      krang_trace comment
      
      comment unless comment.id ==  0
    end
  end
end
