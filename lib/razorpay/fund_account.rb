require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # FundAccount API allows you to create and fetch a fund account for a customer.
  class FundAccount < Entity
    def request
      Razorpay::Request.new(@client, 'fund_accounts')
    end

    def create(options)
      request.create options
    end

    def all(data = {})
      request.all data
    end
  end
end
