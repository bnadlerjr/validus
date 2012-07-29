require_relative "test_helper"
require_relative "../lib/validus"

class ValidusTest < Test::Unit::TestCase
  test "valid? returns true if there are no errors" do
    target = Class.new do
      include Validus
    end

    assert(target.new.valid?, "expected valid? to be true")
  end

  test "#errors is empty if target is valid" do
    target = Class.new do
      include Validus
    end

    assert(target.new.errors.empty?, "expected errors to be empty")
  end

  test "valid? returns false if there are any errors" do
    target = Class.new do
      include Validus

      def validate
        errors.add(:name, 'cannot be empty')
      end
    end

    refute(target.new.valid?, "expected valid? to be false")
  end
end
