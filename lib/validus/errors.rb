module Validus
  # Represents a collection of errors.
  class Errors
    def initialize
      @errors = Hash.new { |hash, key| hash[key] = [] }
    end

    # Add an error +msg+ for an +attribute+.
    def add(attribute, msg)
      @errors[attribute] << msg
    end

    def empty?
      @errors.empty?
    end

    # Returns an Enumerator consisting of all errors associated
    # with +attribute+.
    def for(attribute)
      @errors[attribute].to_enum
    end

    # Returns an Enumerator consisting of all errors for all attributes. The
    # name of the attribute is pre-pended to the error message.
    def full_messages
      @errors.map do |k, v|
        v.map { |error| "#{k} #{error}"}
      end.flatten.to_enum
    end
  end
end