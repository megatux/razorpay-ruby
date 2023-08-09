require 'razorpay/request'
require 'razorpay/refund'
require 'razorpay/entity'

module Razorpay
  # Payment Methods class is allows you to create
  # to fetch all payment methods
  class PaymentMethods < Entity
    def request
      Razorpay::Request.new(@client, 'methods')
    end

    def all(options = {})
      request.all options
    end
  end
end
