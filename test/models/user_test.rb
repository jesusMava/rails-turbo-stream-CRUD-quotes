require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name returns the capitalized part of the email before the @" do
    assert_equal "Accountant", users(:accountant).name
  end
end
