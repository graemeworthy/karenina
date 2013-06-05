module Karenina
  class BookMark

    attr_reader :line
    attr_reader :filename

    def self.get
      self.new.line
    end

    def initialize
      @filename = ENV['HOME'] + '/.karenina_bookmark'
      get_mark
    end

    def get_mark
      begin
         File.open(@filename, 'r+') {|f| @line = f.gets.to_i || 0}
      rescue
         @line = 0
      end
    end

    def increment
      File.open(@filename, 'w+') {|f| f.puts @line +=1 }
    end

    def decrement
      File.open(@filename, 'w+') {|f| f.puts @line -=1 }
    end

  end
end