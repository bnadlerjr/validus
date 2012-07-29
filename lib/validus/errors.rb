module Validus
  class Errors
    def initialize
      @errors = Hash.new { |hash, key| hash[key] = [] }
    end

    def add(attr, msg)
      @errors[attr] << msg
    end

    def empty?
      @errors.empty?
    end

    def for(attr)
      @errors[attr]
    end

    def full_messages
      @errors.map do |k, v|
        v.map { |error| "#{k} #{error}"}
      end.flatten
    end
  end
end