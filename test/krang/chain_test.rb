require 'test_helper'

module Krang
  class ChainTest < Krang::Test
    include Chain
    
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
    
    def test_reset_api
      assert_nil reset_api
    end
    
    def test_backoff
      assert backoff
    end
    
    def test_reset_properties
      assert_nil reset_properties
    end
    
    def test_properties
      assert properties
    end
    
    def test_properties_timeout
      assert properties
      
      Delorean.jump 31 do
        assert properties
      end
    end
    
    def test_block_time
      assert block_time
    end
    
    def test_comment
      refute_nil find_comment('inertia', 'macintosh-napintosh')
    end
    
    def test_comment_bogus
      assert_nil find_comment('bogus', 'bogus')
    end
  end
end
