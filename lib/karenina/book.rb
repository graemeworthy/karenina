module Karenina
  class Book

    attr_reader :lines
    attr_reader :mark


    def initialize(context_lines = 5)
      @context_lines = context_lines
      file  = File.open(Karenina::TEXT_PATH, 'r')
      @lines = file.readlines
      @mark = BookMark.new
    end

    def current_line
        @lines[@mark.line].to_s
    end

    def current_line_is_blank?
        current_line =~ /^\s+$/
    end

    def skip_blank
        while current_line_is_blank?
          @mark.increment
        end
    end

    def print()
      skip_blank
      current_line = @mark.line
      first = current_line - @context_lines > 0 ? current_line - @context_lines : 0
      last  = current_line + @context_lines
      first.upto(last) {|line|
        text = lines[line].to_s
        if line == current_line
          bold_line(text)
        else
          puts text.white
        end
      }
    end

    def bold_line(text)
          separator = ""
          80.times { separator << "-"}
          puts separator
          puts text.white.bold
          puts separator
    end
  end

end
