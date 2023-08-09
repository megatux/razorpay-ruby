require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Settlement API allows you to fetch and delete
  # Docs: https://razorpay.com/docs/api/settlements/
  class Settlement < Entity
    def request
      Razorpay::Request.new(@client, 'settlements')
    end

    def fetch(id)
      request.fetch id
    end

    def reports(options={})
      request.get "recon/combined", options
    end

    def all(options = {})
      request.all options
    end

    def create(options={})
      if(!options.is_a?(String) && options.key?(:settle_full_balance))
        options[:settle_full_balance] = (options[:settle_full_balance] ? 1 : 0)
      end
      request.post "ondemand", options
    end

    def fetch_all_ondemand_settlement(options={})
      request.get "ondemand", options
    end

    def fetch_ondemand_settlement_by_id(id, options={})
      request.get "ondemand/#{id}", options
    end
  end
end
