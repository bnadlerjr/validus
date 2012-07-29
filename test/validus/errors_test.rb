require_relative "../test_helper"
require_relative "../../lib/validus/errors"

module Validus
  class ErrorsTest < Test::Unit::TestCase
    setup do
      @errors = Errors.new
    end

    test "add an error" do
      @errors.add(:name, "cannot be empty")
      refute(@errors.empty?, "did not expect errors to be empty")
    end

    test "can clear errors" do
      @errors.add(:name, "cannot be empty")
      refute(@errors.empty?, "did not expect errors to be empty")

      @errors.clear
      assert(@errors.empty?, "expected errors to be empty")
    end

    test "can get errors for a particular attribute" do
      @errors.add(:name, "cannot be empty")
      assert_equal(['cannot be empty'], @errors.for(:name).to_a)
    end

    test "add multiple errors for a single attribute" do
      @errors.add(:name, "cannot be empty")
      @errors.add(:name, "must be 10 characters")

      expected = ['cannot be empty', 'must be 10 characters']
      assert_equal(expected, @errors.for(:name).to_a)
    end

    test "can get full error messages" do
      @errors.add(:name, "cannot be empty")
      @errors.add(:name, "must be 10 characters")
      @errors.add(:age, "must be greater than zero")

      expected = [
        'name cannot be empty',
        'name must be 10 characters',
        'age must be greater than zero'
      ]

      assert_equal(expected, @errors.full_messages.to_a)
    end
  end
end