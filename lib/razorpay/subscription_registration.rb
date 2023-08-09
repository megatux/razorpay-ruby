require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # SubscriptionRegistration are an alternate way of
  # creating an authorization transaction
  class SubscriptionRegistration < Entity
    def request
      Razorpay::Request.new(@client, 'subscription_registration/auth_links')
    end

    def create(options)
        request.create options
    end
  end
end
