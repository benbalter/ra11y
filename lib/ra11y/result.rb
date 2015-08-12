module Ra11y
  class Result

    attr_accessor :code, :message, :type, :context, :selector, :type_code

    def initialize(hash)
      @code      = hash["code"]
      @message   = hash["message"]
      @type      = hash["type"]
      @context   = hash["context"]
      @selector  = hash["selector"]
      @type_code = hash["typeCode"].to_i
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

    def to_hash
      {
        code: code,
        message: message,
        type: type,
        context: context,
        selector: selector,
        type_code: type_code
      }
    end

    def to_s
      to_hash.map { |key, value| "* #{key}: #{value}" }.join("\n")
    end

    def inspect
      "#<Ra11y::Result code=\"#{code}\" type=\"#{type}\">"
    end
  end
end
