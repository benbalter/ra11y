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
      @results ||= test["results"].map { |hash| Result.new(hash) }
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

    private

    def test
      @test ||= JSON.parse(Ra11y.run_command("file://#{path}"))
    end

    def results_by_type(type)
      results.select { |r| r.type == type }
    end
  end
end
