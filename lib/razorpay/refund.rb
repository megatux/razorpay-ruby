require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Refund class handles all refund objects
  class Refund < Entity
    def request
      Razorpay::Request.new(@client, 'refunds')
    end

    def create(options)
      request.create options
    end

    def all(options = {})
      request.all options
    end

    def fetch(id)
      request.fetch id
    end

    def edit(options = {})
      request.patch id, options
    end
  end
end
