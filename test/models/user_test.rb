require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(
      username: "darth_nihilus",
      name: "Lord Of Hunger",
      password: "ultra_secret_password",
      password_confirmation: "ultra_secret_password"
    )
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "invalid username" do
    invalid_usernames = [
      "", # missing
      "     ", # missing
      "a" * 31, # more than 30 chars
      "h@xxor!" # not within regex
    ]

    invalid_usernames.each do |username|
      @user.username = username
      assert_not @user.valid?
    end
  end

  test "invalid name" do
    invalid_names = [
      "", # missing
      "    ", # missing
      "a" * 31, # more than 31 chars
      "h@xx0r_)(*@#{}", # not within regex
    ]

    invalid_names.each do |name|
      @user.name = name
      assert_not @user.valid?
    end
  end

  test "duplicate username" do
    dup = @user.dup
    @user.save
    assert_not dup.valid?
  end

  test "invalid password" do
    invalid_passwords = [
      "",
      "   ",
      "short"
    ]

    invalid_passwords.each do |password|
      @user.password = @user.password_confirmation = password
      assert_not @user.valid?
    end
  end
end
