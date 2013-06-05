module Karenina
  class Reader

    attr_reader :book

    def initialize()
      @book = Book.new
    end

    def up
      @book.mark.decrement
    end

    def down
      @book.mark.increment
    end

    def to_str
      @book.to_str
    end
  end
end
