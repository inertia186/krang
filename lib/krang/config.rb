module Krang
  module Config
    @@override_config = nil
      
    def override_config(override_config)
      @@override_config = override_config
    end
    
    def config
      return @@override_config if !!@@override_config
      
      config_yml = 'config.yml'
      config = if File.exist?(config_yml)
        YAML.load_file(config_yml)
      else
        raise "Create a file: #{config_yml}"
      end
    end
    
    def init_defaults
      @default_logger = Logger.new("#{@app_key}.log") if !!@app_key
      
      @default_chain_options = {
        logger: @default_logger
      }
    end
    
    def app_key(app_key = nil)
      @app_key = app_key unless app_key.nil?
      raise 'Need to override app_key.' unless !!@app_key
      init_defaults
      @app_key.to_sym
    end
    
    def agent_id(agent_id = nil)
      @agent_id = agent_id unless agent_id.nil?
      @agent_id || Krang::AGENT_ID
    end
    
    def default_value(key)
      ENV["#{app_key.to_s.upcase}_#{key.to_s.upcase}"]
    end
    
    def block_mode
      default_value(:blockmode) || config[app_key][:block_mode]
    end
    
    def chain_options
      chain_options = config[:chain_options].merge(@default_chain_options)
      
      chain = default_value(:chain_options_chain)
      chain_options = chain_options.merge(chain: chain.to_s) if !!chain
      url = default_value(:chain_options_url)
      chain_options = chain_options.merge(url: url) if !!url
      
      chain_options.dup
    end
    
    def logger
      @default_logger
    end
  end
end
