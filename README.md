# Validus

Add validation support to Plain Old Ruby Objects.

## Installation

Add this line to your application's Gemfile:

    gem 'validus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validus

## Usage

Include this module in a target class and override the +validate+ method. Use
+#valid?+ to perform the validation.

Example:

  require "validus"

  class Person
    include Validus

    attr_accessor :name, :age

    def initialize
      @name = ''
      @age  = 0
    end

    def validate
      errors.add(:name, 'cannot be blank') if name == ''
      errors.add(:age, 'must be greater than 0') if age <= 0
    end
  end

  person = Person.new
  person.valid?                    # => false
  person.errors.for(:name).to_a    # => ['cannot be blank']
  person.errors.full_messages.to_a # => ['name cannot be blank', 'age must be greater than 0']

  person.name = 'John'
  person.age  = 20

  person.valid?        # => true
  person.errors.empty? # => true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2012 Bob Nadler

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
