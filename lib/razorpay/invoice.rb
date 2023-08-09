require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Invoice API allows you to create and
  # manage invoices with Razorpay
  class Invoice < Entity
    def request
      Razorpay::Request.new(@client, 'invoices')
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

    def edit(id, options = {})
      request.patch id, options
    end

    def issue(id)
      request.post "#{id}/issue"
    end

    def cancel(id)
      request.post "#{id}/cancel"
    end

    def edit!(id, options = {})
      with_a_bang { edit id, options }
    end

    def issue!(id)
      with_a_bang { issue id }
    end

    def cancel!(id)
      with_a_bang { cancel id }
    end

    def notify_by(id, medium)
      request.post "#{id}/notify_by/#{medium}"
    end

    def delete(id)
      request.delete "#{id}"
    end
  end
end
