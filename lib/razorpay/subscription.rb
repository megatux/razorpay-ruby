require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Subscription API allows you to create and
  # manage subscriptions with Razorpay
  class Subscription < Entity
    def request
      Razorpay::Request.new(@client, 'subscriptions')
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

    def cancel(id, options = {})
      request.post "#{id}/cancel", options
    end

    def cancel!(id, options = {})
      with_a_bang { cancel id, options }
    end

    def edit(options = {})
      request.patch id, options
    end

    def pending_update
      request.get "#{id}/retrieve_scheduled_changes"
    end

    def cancel_scheduled_changes(id)
      request.post "#{id}/cancel_scheduled_changes"
    end

    def pause(id, options = {})
      request.post "#{id}/pause", options
    end

    def resume(id, options = {})
      request.post "#{id}/resume", options
    end

    def delete_offer(id, offerId)
      request.delete "#{id}/#{offerId}"
    end
  end
end
