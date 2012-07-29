require_relative "test_helper"
require_relative "../lib/validus"

class ValidusTest < Test::Unit::TestCase
  BlankTarget = Class.new do
    include Validus
  end

  TargetWithAutoError = Class.new do
    include Validus

    def validate
      errors.add(:name, 'cannot be empty')
    end
  end

  test "valid? returns true if there are no errors" do
    assert(BlankTarget.new.valid?, "expected valid? to be true")
  end

  test "#errors is empty if target is valid" do
    assert(BlankTarget.new.errors.empty?, "expected errors to be empty")
  end

  test "valid? returns false if there are any errors" do
    refute(TargetWithAutoError.new.valid?, "expected valid? to be false")
  end

  test "valid? clears out any existing errors before validating" do
    Target = Class.new do
      include Validus

      attr_accessor :name

      def initialize
        @name = ''
      end

      def validate
        errors.add(:name, 'cannot be blank') if name == ''
      end
    end

    target = Target.new
    refute(target.valid?, "expected target to be invalid")

    target.name = 'John'
    assert(target.valid?, "expected target to be valid")
  end


  test "end to end" do
    Person = Class.new do
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

    refute(person.valid?, "expected person to be invalid")
    assert_equal(['cannot be blank'], person.errors.for(:name).to_a)
    assert_equal(
      ['name cannot be blank', 'age must be greater than 0'],
      person.errors.full_messages.to_a
    )

    person.name = 'John'
    person.age  = 20

    assert(person.valid?, "expected person to be valid")
    assert(person.errors.empty?, "expected errors to be empty")
  end
end
