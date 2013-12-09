module Wepay
  class Error < StandardError
  end

  ##
  # This error is raised when there is an error in the request.
  #
  class ApiError < Error
    attr_reader :type, :code

    def initialize(type, message, code)
      super(message)
      @type = type
      @code = code
    end

    def message
      "#{type} (#{code}): #{super}"
    end
  end

  ##
  # @see Wepay::Configuration#open_timeout
  # @see Wepay::Configuration#timeout
  #
  class TimeoutError < Error
  end
end