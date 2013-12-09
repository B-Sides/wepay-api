module RspecHelper
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    ##
    # Wraps a VCR cassette around API calls with the same name as the Wepay
    # method called. For example, the cassette for `Wepay.checkout.create` will
    # be called "Wepay.checkout.create". Because we repeat the same API calls
    # in different examples, we can just reuse those VCR cassettes rather than
    # recording new ones.
    #
    def record_api_methods
      before do
        stub_const("Wepay::Client::Data", Class.new(Wepay::Client::Data) do
          def make_request(http_method, *args, &block)
            VCR.use_cassette(['wepay', args[0].split('/')].flatten.join('.')) { super }
          end
        end)
      end
    end

    def stub_api_requests
      before do
        Wepay::Client.any_instance.stub(:make_request)
      end
    end
  end
end