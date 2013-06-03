lib =  File.expand_path( File.join(File.dirname(__FILE__), "..", "lib",))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'karenina/version'
require 'karenina/book'
require 'karenina/bookmark'
require "colored"

module Karenina
	TEXT_PATH = File.expand_path( File.join(File.dirname(__FILE__), "..", "text", "from_project_gutenberg.txt",))

	def self.read
	   Book.new.print()
	end
end

Karenina.read
