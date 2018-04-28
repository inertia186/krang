require 'test_helper'

module Krang
  class UtilsTest < Krang::Test
    include Utils
    
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
    
    def test_name_error
      assert_raises NameError do
        assert reset_api
      end
    end
    
    def test_krang_trace
      assert_nil krang_trace "trace"
    end
    
    def test_krang_debug
      assert_nil krang_debug "debug"
    end
    
    def test_krang_info
      assert_nil krang_info "info"
    end
    
    def test_krang_info_detail
      assert_nil krang_info("info", Exception.new)
    end
    
    def test_krang_warning
      assert_nil krang_warning "warning"
    end
    
    def test_krang_error
      assert_nil krang_error "error"
    end
    
    def test_unknown_type
      assert_nil console(:BOGUS, "unknown_type")
    end
    
    def test_parse_slug
      author, permlink = parse_slug '@author/permlink'
      
      assert_equal 'author', author
      assert_equal 'permlink', permlink
    end
    
    def test_parse_slug_to_comment
      url = 'https://steemit.com/chainbb-general/@howtostartablog/the-joke-is-always-in-the-comments-8-sbd-contest#@btcvenom/re-howtostartablog-the-joke-is-always-in-the-comments-8-sbd-contest-20170624t115213474z'
      author, permlink = parse_slug url
      
      assert_equal 'btcvenom', author
      assert_equal 're-howtostartablog-the-joke-is-always-in-the-comments-8-sbd-contest-20170624t115213474z', permlink
    end
  end
end
