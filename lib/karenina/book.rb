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

    def first_line_num
      current_line_num - @context_lines > 0 ? current_line_num - @context_lines : 0
    end

    def last_line_num
      current_line_num + @context_lines
    end

    def current_line_num
      @mark.line
    end

    def print
      output = []
      skip_blank
      first_line_num.upto(last_line_num) {|line|
        text = @lines[line].to_s.chomp
        if line == current_line_num
          output << "#{bold_line(text)}"
        else
          output << "#{text}"
        end
      }
      output.join("\n") + "\n"
    end

    def to_str
      output = []
      first_line_num.upto(last_line_num) {|line|
        text = @lines[line].to_s.chomp
        output << "#{text}"
      }
      output.join("\n") + "\n"
    end

    def bold_line(text)
          output = []
          separator = ""
          80.times { separator << "-"}
          output << separator
          output << text
          output << separator
          output.join("\n")
    end
  end

end
