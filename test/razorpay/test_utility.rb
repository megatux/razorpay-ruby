require 'test_helper'

module Razorpay
  # Tests for Razorpay::Utility
  class RazorpayUtilityTest < Minitest::Test
    def setup
      Razorpay.setup('key_id', 'key_secret')
    end

    def test_payment_signature_verification
      payment_response = {
        razorpay_order_id: 'fake_other_id',
        razorpay_payment_id: 'fake_payment_id',
        razorpay_signature: '965ee2de4c5c4e6f006fb0a5a1736d992e5d4d52f9fe10b98c9b97ee169ebe18'
      }
      Razorpay::Utility.verify_payment_signature(payment_response)

      payment_response[:razorpay_signature] = '_dummy_signature' * 4
      assert_raises(SecurityError) do
        Razorpay::Utility.verify_payment_signature(payment_response)
      end
    end

    def test_payment_signature_verification__with_configuration
      configuration = Razorpay::Configuration.new('user', 'pwd123')
      payment_response = {
        razorpay_order_id: 'fake_other_id',
        razorpay_payment_id: 'fake_payment_id',
        razorpay_signature: '4d25b7df0594d0327d0e81424891edbf744c2523fc3471735646ddd937d16a4f'
      }
      Razorpay::Utility.verify_payment_signature(payment_response, configuration)

      payment_response[:razorpay_signature] = '_dummy_signature' * 4
      assert_raises(SecurityError) do
        Razorpay::Utility.verify_payment_signature(payment_response, configuration)
      end
    end

    def test_payment_link_signature_verification_exception

      payment_response = {
        payment_link_id: 'fake_razorpay_payment_link_id',
        payment_link_reference_id: 'fake_reference_id',
        payment_link_status: 'paid',
        razorpay_payment_id: 'pay_IH3d0ara9bSsjQ',
        razorpay_signature: 'b8a6acda585c9b74e9da393c7354c7e685e37e69d30ae654730f042e674e0283'
      }

      Razorpay::Utility.verify_payment_link_signature(payment_response)

      payment_response[:razorpay_signature] = '_dummy_signature' * 4
      assert_raises(SecurityError) do
        Razorpay::Utility.verify_payment_link_signature(payment_response)
      end
    end

    def test_payment_link_signature_verification_exception__with_configuration
      configuration = Razorpay::Configuration.new('user_x', 'pwd321')
      payment_response = {
        payment_link_id: 'fake_razorpay_payment_link_id',
        payment_link_reference_id: 'fake_reference_id',
        payment_link_status: 'paid',
        razorpay_payment_id: 'pay_IH3d0ara9bSsjQ',
        razorpay_signature: '232d12937aab1332bf00a02c0eb37cf77875705112544d9c8600981b6a954a2f'
      }

      Razorpay::Utility.verify_payment_link_signature(payment_response, configuration)

      payment_response[:razorpay_signature] = '_dummy_signature' * 4
      assert_raises(SecurityError) do
        Razorpay::Utility.verify_payment_link_signature(payment_response, configuration)
      end
    end

    def test_payment_link_signature_verification

      payment_response = {
        payment_link_id: 'fake_razorpay_payment_link_id',
        payment_link_reference_id: 'fake_reference_id',
        payment_link_status: 'paid',
        razorpay_payment_id: 'pay_IH3d0ara9bSsjQ',
        razorpay_signature: 'b8a6acda585c9b74e9da393c7354c7e685e37e69d30ae654730f042e674e0283'
      }

      response = Razorpay::Utility.verify_payment_link_signature(payment_response)
      assert(response)
    end

    def test_payment_link_signature_verification__with_configuration
      configuration = Razorpay::Configuration.new('a_user', 'pwdXYZ')
      payment_response = {
        payment_link_id: 'fake_razorpay_payment_link_id',
        payment_link_reference_id: 'fake_reference_id',
        payment_link_status: 'paid',
        razorpay_payment_id: 'pay_IH3d0ara9bSsjQ',
        razorpay_signature: '800a53b9bd2bb1c7c4ace943e4627903659a02595002069be7c56cb67c884e6f'
      }

      response = Razorpay::Utility.verify_payment_link_signature(payment_response, configuration)
      assert(response)
    end

    def test_subscription_signature_verification
      payment_response = {
        razorpay_payment_id: 'fake_payment_id',
        razorpay_subscription_id: 'fake_other_id',
        razorpay_signature: '3dabcab8ca113e7994cf78c80f8d50974ddfb2d380029743f30a6d67934cd845'
      }
      # A different signature is expected here compared to the previous test,
      # since the sorted order of the keys is different in this case
      Razorpay::Utility.verify_payment_signature(payment_response)

      payment_response[:razorpay_signature] = '_dummy_signature' * 4
      assert_raises(SecurityError) do
        Razorpay::Utility.verify_payment_signature(payment_response)
      end
    end

    def test_subscription_signature_verification__with_configuration
      configuration = Razorpay::Configuration.new('the_user', 'a_pwd')
      payment_response = {
        razorpay_payment_id: 'fake_payment_id',
        razorpay_subscription_id: 'fake_other_id',
        razorpay_signature: 'd36c900744e5d2efaa2c8491f85285447b00b004420ad30788ef8a5eaaf2d25c'
      }
      # A different signature is expected here compared to the previous test,
      # since the sorted order of the keys is different in this case
      Razorpay::Utility.verify_payment_signature(payment_response, configuration)

      payment_response[:razorpay_signature] = '_dummy_signature' * 4
      assert_raises(SecurityError) do
        Razorpay::Utility.verify_payment_signature(payment_response, configuration)
      end
    end

    def test_webhook_signature_verification
      webhook_body = fixture_file('fake_payment_authorized_webhook')
      secret = 'chosen_webhook_secret'
      signature = 'dda9ca344c56ccbd90167b1be0fd99dfa92fe2b827020f27e2a46024e31c7c99'
      Razorpay::Utility.verify_webhook_signature(webhook_body, signature, secret)

      signature = '_dummy_signature' * 4
      assert_raises(SecurityError) do
        Razorpay::Utility.verify_webhook_signature(webhook_body, signature, secret)
      end
    end
  end
end
