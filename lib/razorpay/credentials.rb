module Razorpay
  Credentials = Struct.new(:username, :password) do
    def auth
      {:username => username, :password => password}
    end
  end
end
