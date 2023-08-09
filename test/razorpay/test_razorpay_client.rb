require 'test_helper'
require 'webmock'

module Razorpay
  # Tests for RazorpayClient
  class RazorpayTestClient < Minitest::Test
    def setup
      @client = RazorpayClient.new('key_id', 'key_secret')
    end

    def test_razorpay_should_be_defined
      refute_nil RazorpayClient
    end

    def test_setup
      auth = { username: 'key_id', password: 'key_secret' }
      assert_equal auth, @client.credentials.auth
    end

    def atest_custom_header
      custom_headers = { 'key' => 'value' }
      stub_get(/$/, 'hello_response')
      headers = custom_headers
      Razorpay::Request.new(@client, 'dummy').make_test_request
      user_agent = "Razorpay-Ruby/#{Razorpay::VERSION}; Ruby/#{RUBY_VERSION}"
      headers = { 'User-Agent' => user_agent, 'Authorization' => 'Basic a2V5X2lkOmtleV9zZWNyZXQ=' }
      headers = headers.merge(custom_headers)
      assert_requested :get, 'https://api.razorpay.com/',
                       headers: headers,
                       times: 1
    end

    # We make a request to the / endpoint to test SSL support
    def atest_sample_request
      WebMock.allow_net_connect!
      req = Razorpay::Request.new(@client, 'dummy')
      response = req.make_test_request.parsed_response
      assert_equal 'Welcome to Razorpay API.', response['message']
      WebMock.disable_net_connect!
    end

    # We mock this request
    def atest_auth_header_and_user_agent
      stub_get(/$/, 'hello_response')
      Razorpay::Request.new(@client, 'dummy').make_test_request
      user_agent = "Razorpay-Ruby/#{Razorpay::VERSION}; Ruby/#{RUBY_VERSION}"
      headers = { 'User-Agent' => user_agent, 'Authorization' => 'Basic a2V5X2lkOmtleV9zZWNyZXQ=' }
      assert_requested :get, 'https://api.razorpay.com/',
                       headers: headers,
                       times: 1
    end

    # def test_x
    #   @client = RazorpayClient.new 'rzp_test_....', '....'
    #   WebMock.allow_net_connect!

    #   payments = Razorpay::Payment.new(@client).all({"count":2})
    #   pp payments
    # end
  end
end
