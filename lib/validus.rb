require "validus/version"
require "validus/errors"

module Validus
  def validate
  end

  def valid?
    validate
    errors.empty?
  end

  def errors
    @errors ||= Errors.new
  end
end
