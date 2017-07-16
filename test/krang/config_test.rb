require 'test_helper'

module Krang
  class ConfigTest < Krang::Test
    include Config
    
    def setup
      app_key :test_app
      agent_id 'test_app/0.0.1'
      override_config(
        test_app: {
          block_mode: 'irreversible',
        }, chain_options: {
          chain: 'steem',
          url: 'https://steemd.steemit.com'
        }
      )
    end
  end
end
