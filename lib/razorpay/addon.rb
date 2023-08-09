require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Addon API allows you to fetch and delete
  # subscription-addons with Razorpay
  class Addon < Entity
    def request
      Razorpay::Request.new(@client, 'addons')
    end

    def fetch(id)
      request.fetch id
    end

    def all(options = {})
       request.all options
    end

    def create(subscription_id, options)
      r = request
      # POST /addons is not supported
      # Addon creation endpoint is:
      # POST subscriptions/{sub_id}/addons
      r.request :post, "/subscriptions/#{subscription_id}/addons", options
    end

    def delete(id)
      request.delete id
    end
  end
end
