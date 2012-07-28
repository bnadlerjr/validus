require "test/unit"
require "contest"
require "minitest/reporters"
MiniTest::Reporters.use!

module Validus
  class ValidusTest < Test::Unit::TestCase
    test "hookup" do
      assert_equal(1, 1)
    end
  end
end