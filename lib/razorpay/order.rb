require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Order API allows you to associate
  # Payments with an order entity
  class Order < Entity
    def self.request(configuration = nil)
      Razorpay::Request.new("orders", configuration)
    end

    def self.create(options, configuration = nil)
      request(configuration).create options
    end

    def self.fetch(id, configuration = nil)
      request(configuration).fetch id
    end

    def self.all(options = {}, configuration = nil)
      request(configuration).all options
    end

    def payments(options = {}, configuration = nil)
      r = self.class.request(configuration)
      r.request :get, "/orders/#{id}/payments", options
    end

    def self.edit(id, options = {}, configuration = nil)
      request(configuration).patch id, options
    end

    def self.fetch_transfer_order(id, configuration = nil)
      # Fetch Transfer for an Order
      # Docs: https://razorpay.com/docs/api/payments/route/#fetch-transfer-for-an-order
      request(configuration).get "#{id}/?expand[]=transfers&status"
    end
  end
end
