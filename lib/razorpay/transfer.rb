require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Transfer class handles all refund objects
  class Transfer < Entity
    def request
      Razorpay::Request.new(@client, 'transfers')
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

    def reverse(options = {})
      request.post "#{id}/reversals", options
    end

    def fetch_settlements
      request.get "?expand[]=recipient_settlement"
    end
  end
end
