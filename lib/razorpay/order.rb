require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Order API allows you to associate
  # Payments with an order entity
  class Order < Entity
    def request
      Razorpay::Request.new(@client, 'orders')
    end

    def create(options)
      request.create options
    end

    def fetch(id)
      request.fetch id
    end

    def all(options = {})
      request.all options
    end

    def payments(options = {})
      r = request
      r.request :get, "/orders/#{id}/payments", options
    end

    def edit(id, options = {})
      request.patch id, options
    end

    def fetch_transfer_order(id)
      # Fetch Transfer for an Order
      # Docs: https://razorpay.com/docs/api/payments/route/#fetch-transfer-for-an-order
      request.get "#{id}/?expand[]=transfers&status"
    end
  end
end
