require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # QrCode API allows you to create, close and fetch QR codes
  class QrCode < Entity
    def request
      Razorpay::Request.new(@client, 'payments/qr_codes')
    end

    def create(options)
        if(!options.is_a?(String) && options.key?(:fixed_amount))
           options[:fixed_amount] = (options[:fixed_amount] ? 1 : 0)
        end
      request.create options
    end

    def fetch(id)
      request.fetch id
    end

    def all(options = {})
      request.all options
    end

    def fetch_payments(options = {})
      request.get "#{id}/payments", options
    end

    def close
      request.post "#{id}/close"
    end
  end
end
