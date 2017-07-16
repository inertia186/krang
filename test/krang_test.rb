require 'test_helper'

module Krang
  class KrangTest < Krang::Test
    include Config
    
    def setup
      app_key :test_app
      
      override_config(
        test_app: {
          block_mode: 'irreversible',
        }, chain_options: {
          chain: 'steem',
          url: 'https://steemd.steemit.com'
        }
      )
    end
    
    def test_block_mode
      assert block_mode
    end
  end
end
