module Ra11y
  class Result

    attr_accessor :code, :message, :type
    alias_method :to_s, :message

    def initialize(hash)
      @code    = hash["code"]
      @message = hash["message"]
      @type    = hash["type"]
    end

    def error?
      type == "error"
    end

    def notice?
      type == "notice"
    end

    def warning?
      type == "warning"
    end

    def inspect
      "#<Ra11y::Result code=\"#{code}\" type=\"#{type}\">"
    end
  end
end
