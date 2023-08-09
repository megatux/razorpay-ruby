require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Virtual Account API allows you to create and
  # manage virtual accounts with Razorpay
  class VirtualAccount < Entity
    def request
      Razorpay::Request.new(@client, 'virtual_accounts')
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

    def close(id)
       request.post "#{id}/close"
    end

    def close!
      with_a_bang { close }
    end

    def payments(options = {})
      r = request
      r.request :get, "/virtual_accounts/#{id}/payments", options
    end

    def add_receiver(id, options = {})
      request.post "#{id}/receivers", options
    end

    def allowed_payer(id, options = {})
      request.post "#{id}/allowed_payers", options
    end

    def delete_allowed_payer(id, payer_id)
      request.delete "#{id}/allowed_payers/#{payer_id}"
    end
  end
end
