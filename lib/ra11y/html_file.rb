module Ra11y
  class HtmlFile

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def perfect?
      errors.empty? && warnings.empty?
    end

    def results
      @results ||= test.map { |hash| Result.new(hash) }
    end

    def errors
      @errors ||= results_by_type "error"
    end

    def warnings
      @warnings ||= results_by_type "warning"
    end

    def notices
      @notices ||= results_by_type "notice"
    end

    def inspect
      "#<Ra11y::HtmlFile path=\"#{path.gsub(Dir.pwd, "")}\" errors=#{errors.count} warnings=#{warnings.count} notices=#{notices.count}>"
    end

    # Is this file a jekyll-redirect-from style redirect?
    def redirect?
      contents =~ /<title>Redirecting\.\.\.<\/title>/
    end

    private

    def contents
      @content ||= File.open(path).read
    end

    def test
      @test ||= begin
        output = Ra11y.run_command("file://#{path}")
        JSON.parse(output)
      rescue JSON::ParserError
        raise Pa11yError, output
      end
    end

    def results_by_type(type)
      results.select { |r| r.type == type }
    end
  end
end
