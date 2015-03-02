module Ra11y
  class Site

    attr_accessor :path

    def initialize(path)
      @path = File.expand_path(path, Dir.pwd)
    end

    def run
      puts "Site: #{path}"
      puts "Running Ra11y on #{paths.count} files..."
      puts "Errors: #{errors.count}, Warnings: #{warnings.count}, Notices: #{notices.count}"

      html_files.each do |file|

        puts "#{file.path} (Errors: #{file.errors.count}, Warnings: #{file.warnings.count}, Notices: #{file.notices.count}):".blue

        file.results.each do |result|
          output = "#{result.type.capitalize}: #{result}"

          if result.error?
            output = output.red
          elsif result.warning?
            output = output.yellow
          else
            output = output.white
          end

          puts "  * #{output}"
        end
      end

      exit 1 unless perfect?
    end

    def paths
      pattern = File.join(path, '**', "*html")
      Dir.glob(pattern).select { |fn| File.file? fn }
    end

    def html_files
      @files ||= Parallel.map(paths) { |p| Ra11y::HtmlFile.new(p) }
    end

    def perfect?
      errors.empty? && warnings.empty?
    end

    def errors
      @errors ||= results_by_type("errors")
    end

    def warnings
      @warnings ||= results_by_type("warnings")
    end

    def notices
      @notices ||= results_by_type("notices")
    end

    def inspect
      "#<Ra11y::HtmlFile errors=#{errors.count} warnings=#{warnings.count} notices=#{notices.count}>"
    end

    private

    def results_by_type(type)
      html_files.map { |file| file.send(type) }.flatten
    end
  end
end
