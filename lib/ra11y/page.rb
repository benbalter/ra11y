require 'tempfile'

module Ra11y
  class Page < Ra11y::Site
    def initialize(name, html)
      @name = name
      @tmp = Tempfile.new(name)
      @tmp << html
      @path = File.expand_path(@tmp.path, Dir.pwd)
    end
    
    def paths
      [@tmp.path]
    end
    
    def run
      html_files.each do |file|

        puts "ra11y output:"
        puts "#{@name} (Errors: #{file.errors.count}, Warnings: #{file.warnings.count}, Notices: #{file.notices.count}):".blue

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

      return errors, warnings, notices
    end
  end
end
