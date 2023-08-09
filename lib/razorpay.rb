require 'razorpay/credentials'
require 'razorpay/card'
require 'razorpay/order'
require 'razorpay/errors'
require 'razorpay/refund'
require 'razorpay/invoice'
require 'razorpay/payment'
require 'razorpay/utility'
require 'razorpay/customer'
require 'razorpay/constants'
require 'razorpay/collection'
require 'razorpay/virtual_account'
require 'razorpay/plan'
require 'razorpay/subscription'
require 'razorpay/addon'
require 'razorpay/transfer'
require 'razorpay/subscription_registration'
require 'razorpay/settlement'
require 'razorpay/payment_link'
require 'razorpay/fund_account'
require 'razorpay/item'
require 'razorpay/qr_code'
require 'razorpay/payment_method'

# Base Razorpay module
module Razorpay
  class RazorpayClient
    attr_reader :credentials, :custom_headers

    def initialize(key_id, key_secret, custom_headers = {})
      @credentials = ::Razorpay::Credentials.new(key_id, key_secret)
      @custom_headers = custom_headers
    end
  end
end
