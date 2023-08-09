require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Item API allows you to create and fetch customers on Razorpay
  class Item < Entity
    def request
      Razorpay::Request.new(@client, 'items')
    end

    def create(options)
      request.create options
    end

    def fetch(id)
      request.fetch id
    end

    def edit(id, options = {})
      if(!options.is_a?(String) && options.key?(:active))
        options[:active] = (options[:active] ? 1 : 0)
      end
      request.patch id, options
    end

    def all(options = {})
      request.all options
    end

    def delete(id)
        request.delete id
    end
  end
end
