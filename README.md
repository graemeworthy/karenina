# Karenina

If you added up the time you spent waiting for rails to load before you could run your tests, you could have read a russian novel.

Karenina prints one line (and some context) of the Anna Karenina each time you run your tests, and keeps track of where you are, so you can read across multiple apps!


## Installation

Add this line to your application's Gemfile:

    group :test do
      gem 'karenina'
    end

And this line to your spec/spec_helper, at the top please

    require 'karenina'


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install karenina

