require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Customer API allows you to create and fetch customers on Razorpay
  class Customer < Entity
    def request
      Razorpay::Request.new(@client, 'customers')
    end

    def create(options)
      request.create options
    end

    def fetch(id)
      request.fetch id
    end

    def edit(id, options = {})
      request.put id, options
    end

    def all(options = {})
      request.all options
    end

    # Fetch token by customerId
    # https://razorpay.com/docs/api/recurring-payments/upi/tokens/#22-fetch-tokens-by-customer-id
    def fetchTokens
      request.get "#{id}/tokens"
    end

   # Fetch specific token
    def fetchToken(tokenId)
      request.get "#{id}/tokens/#{tokenId}"
    end

    def deleteToken(tokenId)
      request.delete "#{id}/tokens/#{tokenId}"
    end
  end
end
