require "validus/version"
require "validus/errors"

# Add validation support to Plain Old Ruby Objects. Include this module in a
# target class and override the +validate+ method. Use +#valid?+ to perform
# the validation.
#
# Example:
#
# require "validus"
#
# class Person
#   include Validus
#
#   attr_accessor :name, :age
#
#   def initialize
#     @name = ''
#     @age  = 0
#   end
#
#   def validate
#     errors.add(:name, 'cannot be blank') if name == ''
#     errors.add(:age, 'must be greater than 0') if age <= 0
#   end
# end
#
# person = Person.new
# person.valid?                    # => false
# person.errors.for(:name).to_a    # => ['cannot be blank']
# person.errors.full_messages.to_a # => ['name cannot be blank', 'age must be greater than 0']
#
# person.name = 'John'
# person.age  = 20
#
# person.valid?        # => true
# person.errors.empty? # => true
module Validus
  # Abstract method that performs validation. Override this method in the
  # target class. Overriding methods should use +errors#add+ to add
  # validation errors. For example:
  #
  # def validate
  #   errors.add(:name, 'cannot be blank') if name.blank?
  # end
  #
  # This method is not meant to be called directly... use +#valid?+ instead.
  def validate
  end

  # Calls +validate+ and returns +true+ if there are any +errors+ on the target's attributes.
  def valid?
    errors.clear
    validate
    errors.empty?
  end

  # An instance of an +Errors+ object.
  def errors
    @errors ||= Errors.new
  end
end
