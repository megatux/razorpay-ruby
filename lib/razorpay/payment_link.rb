require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Payment Links are URLs that you can send to your customers
  # through SMS and email to collect payments from them.
  class PaymentLink < Entity
    def request
      Razorpay::Request.new(@client, 'payment_links')
    end

    def create(options)
      request.create options
    end

    def fetch(id)
      request.fetch id
    end

    def edit(id, options = {})
      request.patch id, options
    end

    def all(options = {})
      request.all options
    end

    def cancel(id)
      request.post "#{id}/cancel"
    end

    def notify_by(id,medium)
      request.post "#{id}/notify_by/#{medium}"
    end
  end
end
