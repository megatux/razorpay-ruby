require 'razorpay/request'
require 'razorpay/refund'
require 'razorpay/entity'

module Razorpay
  # Payment class is the most commonly used class
  # and is used to interact with Payments, the most
  # common type of transactions
  class Payment < Entity
    def request
      Razorpay::Request.new(@client, 'payments')
    end

    def create_recurring_payment(data={})
      request.post "create/recurring" , data
    end

    def create_json_payment(data={})
      request.post "create/json" , data
    end

    def fetch_payment_downtime
      request.get "downtimes"
    end

    def fetch_payment_downtime_by_id(id)
      request.get "downtimes/#{id}"
    end

    def fetch_card_details(id)
      request.get "#{id}/card"
    end

    def fetch_transfer
      request.get "#{id}/transfers"
    end

    def fetch_refund(refundId)
      request.get "#{id}/refunds/#{refundId}"
    end

    def fetch_multiple_refund(id, options = {})
      request.get "#{id}/refunds",options
    end

    def transfer(options = {})
      request.post "#{id}/transfers", options
    end

    def edit(options = {})
      request.patch id, options
    end

    def fetch(id)
      request.fetch id
    end

    def all(options = {})
      request.all options
    end

    def capture(id, options)
      request.post "#{id}/capture", options
    end

    def refund(options = {})
      request.post "#{id}/refund", options
    end

    def refund!(options = {})
      refund = refund options
      with_a_bang { request.fetch id }
      refund
    end

    def capture!(id, options)
      with_a_bang { capture id, options }
    end

    def refunds
      request.get "#{id}/refunds"
    end

    def method
      method_missing(:method)
    end

    def bank_transfer
      request.get "#{id}/bank_transfer"
    end

    def otp_generate(id)
      request.post "#{id}/otp_generate"
    end

    def otp_submit(options)
      request.post "#{id}/otp/submit", options
    end

    def otp_resend
      request.post "#{id}/otp/resend"
    end

    def create_upi(data={})
      request.post "create/upi" , data
    end

    def validate_vpa(data={})
      request.post "validate/vpa" , data
    end
  end
end
